part of openid_flutter_repository;

class BaseRepository {
  Future getHttp(Uri url,
      {Map<String, String>? headers, required http.Client? client}) async {
    return _processResponse(await _withClient(
        (client) => client.get(url, headers: headers), client));
  }

  Future postHttp(Uri url,
      {Map<String, String>? headers,
      body,
      Encoding? encoding,
      required http.Client? client}) async {
    return _processResponse(await _withClient(
        (client) =>
            client.post(url, headers: headers, body: body, encoding: encoding),
        client));
  }
}
