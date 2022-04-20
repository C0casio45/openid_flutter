part of openid_flutter;

class Issuer {
  /// The OpenId Provider's metadatas
  final OpenIdProviderMetadata metaDatas;

  final Map<String, String> claimsMap;

  final JsonWebKeyStore _keyStore;

  static final Map<Uri, Issuer?> _discoveries = {};

  static Iterable<Uri> get knownIssuers => _discoveries.keys;

  /// Creates an issuer from its metadata.
  Issuer(this.metaDatas, {this.claimsMap = const {}})
      : _keyStore = metaDatas.jwksUri == null
            ? JsonWebKeyStore()
            : (JsonWebKeyStore()..addKeySetUrl(metaDatas.jwksUri!));

  static Future<Issuer> discover(Uri uri, {http.Client? httpClient}) async {
    if (_discoveries[uri] != null) return _discoveries[uri]!;

    var segments = uri.pathSegments.toList();
    if (segments.isNotEmpty && segments.last.isEmpty) {
      segments.removeLast();
    }
    segments.addAll(['.well-known', 'openid-configuration']);
    uri = uri.replace(pathSegments: segments);

    var json = await BaseRepository.getHttp(uri, client: httpClient);
    return _discoveries[uri] = Issuer(OpenIdProviderMetadata.fromJson(json));
  }
}
