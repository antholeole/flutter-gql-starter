import 'package:ferry/ferry.dart';
import 'package:gql_client/src/token_manager.dart';
import 'package:gql_exec/gql_exec.dart';
import 'package:gql_http_link/gql_http_link.dart';

class RefresherLink extends Link {
  final String _refreshFailKey;
  final TokenManager _tokenManager;

  RefresherLink(
      {required TokenManager tokenManager, required String refreshFailKey})
      : _tokenManager = tokenManager,
        _refreshFailKey = refreshFailKey;

  Future<Map<String, String>> _buildTokenHeader() async {
    return {
      'Authorization': 'Bearer ${await _tokenManager.getAuthentication()}',
      'x-hasura-role': 'user'
    };
  }

  bool _shouldRefresh(Response resp) {
    for (final error in resp.errors ?? <GraphQLError>[]) {
      if (error.message.contains(_refreshFailKey)) {
        return true;
      }
    }
    return false;
  }

  Future<Request> _updateRequestHeaders(Request request) async {
    final tokenHeaders = await _buildTokenHeader();

    final updatedRequest = request.updateContextEntry<HttpLinkHeaders>(
      (headers) => HttpLinkHeaders(
        headers: {
          ...headers?.headers ?? <String, String>{},
        }..addAll(tokenHeaders),
      ),
    );

    return updatedRequest;
  }

  @override
  Stream<Response> request(Request request, [NextLink? forward]) async* {
    final updatedRequest = await _updateRequestHeaders(request);

    if (forward != null) {
      await for (final result in forward(updatedRequest)) {
        if (_shouldRefresh(result)) {
          await _tokenManager.getAuthentication(forceRefresh: true);
          yield* forward(await _updateRequestHeaders(request));
        } else {
          yield result;
        }
      }
    }
  }
}
