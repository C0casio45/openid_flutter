part of openid_flutter.models;

class OpenIdClaims extends JsonWebTokenClaims with UserInfo {
  /// Time when the End-User authentication occurred.
  DateTime? get authTime => this['auth_time'] == null
      ? null
      : DateTime.fromMillisecondsSinceEpoch(this['auth_time'] * 1000);

  /// String value used to associate a Client session with an ID Token, and to
  /// mitigate replay attacks.
  String? get nonce => this['nonce'];

  /// Identifies the Authentication Context Class that the authentication
  /// performed satisfied.
  String? get authenticationContextClassReference => this['acr'];

  /// List of strings that are identifiers for authentication methods used in
  /// the authentication.
  List<String>? get authenticationMethodsReferences =>
      (this['amr'] as List?)?.cast();

  /// The party to which the ID Token was issued.
  String? get authorizedParty => this['azp'];

  @override
  Uri get issuer => super.issuer!;

  @override
  List<String> get audience => super.audience!;

  @override
  DateTime get expiry => super.expiry!;

  @override
  DateTime get issuedAt => super.issuedAt!;

  OpenIdClaims.fromJson(Map<String, dynamic> json) : super.fromJson(json);

  @override
  Iterable<Exception> validate(
      {Duration expiryTolerance = const Duration(),
      Uri? issuer,
      String? clientId,
      String? nonce}) sync* {
    yield* super.validate(
        expiryTolerance: expiryTolerance, issuer: issuer, clientId: clientId);
    if (audience.length > 1 && authorizedParty == null) {
      yield JoseException('No authorized party claim present.');
    }

    if (authorizedParty != null && authorizedParty != clientId) {
      yield JoseException('Invalid authorized party claim.');
    }

    if (nonce != null && nonce != this.nonce) {
      yield JoseException('Nonce does not match.');
    }
  }
}
