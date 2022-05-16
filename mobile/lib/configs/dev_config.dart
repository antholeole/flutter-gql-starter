import 'package:mobile/configs/base_config.dart';

class DevConfig extends Config {
  @override
  Uri get gqlEndpoint => Uri(
        scheme: 'http',
        host: 'localhost',
        port: 8080,
        pathSegments: ['graphql'],
      );
}
