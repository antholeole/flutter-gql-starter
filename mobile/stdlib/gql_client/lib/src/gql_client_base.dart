import 'package:ferry/ferry.dart';
import 'package:gql_client/src/refresher_link.dart';
import 'package:gql_client/src/token_manager.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:gql_websocket_link/gql_websocket_link.dart';
import 'package:local_user/local_user.dart';
import 'package:normalize/utils.dart';
import 'package:http/http.dart' as http;
import 'package:web_socket_channel/io.dart';

import 'cache.dart';

class GqlClient {
  final Client _client;

  GqlClient._(Client client) : _client = client;

  static Exception _bundleException<TData, TVars>(
      OperationResponse<TData, TVars> response) {
    if (!response.hasErrors) {
      return Exception('unspecified graphQL exception');
    }

    if (response.linkException != null) {
      return response.linkException!.originalException;
    }

    StringBuffer message = StringBuffer();
    for (final error in response.graphqlErrors!) {
      message.write("${error.message}, ");
    }

    return Exception(message.toString());
  }

  static Future<GqlClient> build(
      {required LocalUser localUser,
      required String refreshFailKey,
      required RequestRefresh refreshRequest,
      required Uri endpoint}) async {
    final TokenManager tokenManager =
        TokenManager(localUser: localUser, requestRefresh: refreshRequest);

    final link = Link.from([
      RefresherLink(
        tokenManager: tokenManager,
        refreshFailKey: refreshFailKey,
      ),
      Link.split(
        (request) =>
            getOperationDefinition(
              request.operation.document,
              request.operation.operationName,
            ).type ==
            OperationType.subscription,
        WebSocketLink(null, channelGenerator: () async {
          return IOWebSocketChannel.connect(endpoint, headers: {
            'Authorization': 'Bearer ${await tokenManager.getAuthentication()}'
          });
        }),
      ),
      HttpLink(endpoint.toString(), httpClient: http.Client()),
    ]);

    return GqlClient._(
        Client(link: link, cache: await buildCache(memoryCache: false)));
  }

  Stream<TData> request<TData, TVars>(OperationRequest<TData, TVars> request) {
    return _client.request(request).asyncMap((resp) async {
      if (resp.hasErrors) {
        throw _bundleException(resp);
      } else {
        return resp.data!;
      }
    });
  }
}
