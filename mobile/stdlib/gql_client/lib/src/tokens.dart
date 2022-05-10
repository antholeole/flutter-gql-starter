import 'package:uuid_type/uuid_type.dart';

class LoggedInBundle {
  final String refreshToken;
  final UuidType userId;

  const LoggedInBundle({required this.userId, required this.refreshToken});
}
