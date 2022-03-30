part of openid_flutter.models;

class IdToken extends JsonWebToken {
  IdToken.unverified(String serialization) : super.unverified(serialization);

  @override
  OpenIdClaims get claims => OpenIdClaims.fromJson(super.claims.toJson());
}