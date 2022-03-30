part of openid_flutter;

class Issuer {
  /// The OpenId Provider's metadatas
  final OpenIdProviderMetadata metaDatas;

  final Map<String, String> claimsMap;

  final JsonWebKeyStore keyStore;

  Issuer(this.metaDatas, this.claimsMap, this.keyStore);
}
