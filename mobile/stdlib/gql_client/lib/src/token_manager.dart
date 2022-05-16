import 'package:local_user/local_user.dart';
import 'package:uuid_type/uuid_type.dart';

typedef RequestRefresh = Future<String> Function(
    UuidType userId, String refreshToken);

class TokenManager {
  final LocalUser _localUser;
  String? _accessTokenCache;
  final RequestRefresh _requestRefresh;

  TokenManager(
      {required LocalUser localUser, required RequestRefresh requestRefresh})
      : _localUser = localUser,
        _requestRefresh = requestRefresh;

  //returns an access token if authenticated; returns null if not authenticated.
  //throws an exception if refresh fails
  Future<String?> getAuthentication({bool forceRefresh = false}) async {
    final loggedInUserId = _localUser.maybeOn(loggedIn: (userId) => userId);

    if (loggedInUserId == null) {
      return null;
    }

    final refreshToken = await _localUser.refreshToken;
    if (refreshToken == null) {
      throw RefreshFailed.fromMessage(
          'User logged in, but no refresh token saved');
    }

    if (forceRefresh || _accessTokenCache == null) {
      try {
        _accessTokenCache = await _requestRefresh(loggedInUserId, refreshToken);
      } on Exception catch (e) {
        throw RefreshFailed.fromException(e);
      }
    }

    return _accessTokenCache;
  }
}

class RefreshFailed implements Exception {
  final String message;

  RefreshFailed.fromException(Exception e) : message = e.toString();
  RefreshFailed.fromMessage(this.message);

  @override
  String toString() {
    return "Refresh failed: $message";
  }
}
