part of openid_flutter;

class Issuer {
  /// The OpenId Provider's metadatas
  final OpenIdProviderMetadata metaDatas;

  final Map<String, String> claimsMap;

  final JsonWebKeyStore _keyStore;

  /// Creates an issuer from its metadata.
  Issuer(this.metaDatas, {this.claimsMap = const {}})
      : _keyStore = metaDatas.jwksUri == null
            ? JsonWebKeyStore()
            : (JsonWebKeyStore()..addKeySetUrl(metaDatas.jwksUri!));
}
