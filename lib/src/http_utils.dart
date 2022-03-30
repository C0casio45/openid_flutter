import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

export 'package:http/http.dart' show Client;

final _logger = Logger('openid_client');

typedef ClientFactory = http.Client Function();



dynamic _processResponse(http.Response response) {
  _logger.fine(
      '${response.request!.method} ${response.request!.url}: ${response.body}');
  var contentType = response.headers.entries
      .firstWhere((v) => v.key.toLowerCase() == 'content-type',
          orElse: () => MapEntry('', ''))
      .value;
  var isJson = contentType.split(';').first == 'application/json';

  var body = isJson ? json.decode(response.body) : response.body;
  if (body is Map && body['error'] is String) {
    throw OpenIdException(
        body['error'], body['error_description'], body['error_uri']);
  }
  if (response.statusCode < 200 || response.statusCode >= 300) {
    throw HttpRequestException(statusCode: response.statusCode, body: body);
  }
  return body;
}

Future<T> _withClient<T>(Future<T> Function(http.Client client) fn,
    [http.Client? client0]) async {
  var client = client0 ?? http.Client();
  try {
    return await fn(client);
  } finally {
    if (client != client0) client.close();
  }
}

class AuthorizedClient extends http.BaseClient {
  final http.Client baseClient;

  final Credential credential;

  AuthorizedClient(this.baseClient, this.credential);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    var token = await credential.getTokenResponse();
    if (token.tokenType != null && token.tokenType!.toLowerCase() != 'bearer') {
      throw UnsupportedError('Unknown token type: ${token.tokenType}');
    }

    request.headers['Authorization'] = 'Bearer ${token.accessToken}';

    return baseClient.send(request);
  }
}
