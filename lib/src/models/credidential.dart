part of openid_flutter.models;

class Credential {
  TokenResponse _token;
  final Client client;
  final String? nonce;

  final StreamController<TokenResponse> _onTokenChanged =
      StreamController.broadcast();

  Credential._(this.client, this._token, this.nonce);

  Map<String, dynamic>? get response => _token.toJson();

  Future<UserInfo> getUserInfo() async {
    var uri = client.issuer.metadata.userinfoEndpoint;
    if (uri == null) {
      throw UnsupportedError('Issuer does not support userinfo endpoint.');
    }
    return UserInfo.fromJson(await _get(uri));
  }

  /// Emits a new [TokenResponse] every time the token is refreshed
  Stream<TokenResponse> get onTokenChanged => _onTokenChanged.stream;

  /// Allows clients to notify the authorization server that a previously
  /// obtained refresh or access token is no longer needed
  ///
  /// See https://tools.ietf.org/html/rfc7009
  Future<void> revoke() async {
    var uri = client.issuer.metadata.revocationEndpoint;
    if (uri == null) {
      throw UnsupportedError('Issuer does not support revocation endpoint.');
    }
    var request = _token.refreshToken != null
        ? {'token': _token.refreshToken, 'token_type_hint': 'refresh_token'}
        : {'token': _token.accessToken, 'token_type_hint': 'access_token'};
    await _post(uri, body: request);
  }

  /// Returns an url to redirect to for a Relying Party to request that an
  /// OpenID Provider log out the End-User.
  ///
  /// [redirectUri] is an url to which the Relying Party is requesting that the
  /// End-User's User Agent be redirected after a logout has been performed.
  ///
  /// [state] is an opaque value used by the Relying Party to maintain state
  /// between the logout request and the callback to [redirectUri].
  ///
  /// See https://openid.net/specs/openid-connect-rpinitiated-1_0.html
  Uri? generateLogoutUrl({Uri? redirectUri, String? state}) {
    return client.issuer.metadata.endSessionEndpoint?.replace(queryParameters: {
      'id_token_hint': _token.idToken.toCompactSerialization(),
      if (redirectUri != null)
        'post_logout_redirect_uri': redirectUri.toString(),
      if (state != null) 'state': state
    });
  }

  http.Client createHttpClient([http.Client? baseClient]) =>
      http.AuthorizedClient(
          baseClient ?? client.httpClient ?? http.Client(), this);

  Future _get(uri) async {
    return http.get(uri, client: createHttpClient());
  }

  Future _post(uri, {dynamic body}) async {
    return http.post(uri, client: createHttpClient(), body: body);
  }

  IdToken get idToken => _token.idToken;

  Stream<Exception> validateToken(
      {bool validateClaims = true, bool validateExpiry = true}) async* {
    var keyStore = JsonWebKeyStore();
    var jwksUri = client.issuer.metadata.jwksUri;
    if (jwksUri != null) {
      keyStore.addKeySetUrl(jwksUri);
    }
    if (!await idToken.verify(keyStore,
        allowedArguments:
            client.issuer.metadata.idTokenSigningAlgValuesSupported)) {
      yield JoseException('Could not verify token signature');
    }

    yield* Stream.fromIterable(idToken.claims
        .validate(
            expiryTolerance: const Duration(seconds: 30),
            issuer: client.issuer.metadata.issuer,
            clientId: client.clientId,
            nonce: nonce)
        .where((e) =>
            validateExpiry ||
            !(e is JoseException && e.message.startsWith('JWT expired.'))));
  }

  String? get refreshToken => _token.refreshToken;

  Future<TokenResponse> getTokenResponse([bool forceRefresh = false]) async {
    if (!forceRefresh &&
        _token.accessToken != null &&
        (_token.expiresAt == null ||
            _token.expiresAt!.isAfter(DateTime.now()))) {
      return _token;
    }
    if (_token.accessToken == null && _token.refreshToken == null) {
      return _token;
    }

    var json = await http.post(client.issuer.tokenEndpoint,
        body: {
          'grant_type': 'refresh_token',
          'refresh_token': _token.refreshToken,
          'client_id': client.clientId,
          if (client.clientSecret != null) 'client_secret': client.clientSecret
        },
        client: client.httpClient);

    _token =
        TokenResponse.fromJson({'refresh_token': _token.refreshToken, ...json});
    _onTokenChanged.add(_token);
    return _token;
  }

  Credential.fromJson(Map<String, dynamic> json, {http.Client? httpClient})
      : this._(
            Client(
                Issuer(OpenIdProviderMetadata.fromJson(
                    (json['issuer'] as Map).cast())),
                json['client_id'],
                clientSecret: json['client_secret'],
                httpClient: httpClient),
            TokenResponse.fromJson((json['token'] as Map).cast()),
            json['nonce']);

  Map<String, dynamic> toJson() => {
        'issuer': client.issuer.metadata.toJson(),
        'client_id': client.clientId,
        'client_secret': client.clientSecret,
        'token': _token.toJson(),
        'nonce': nonce
      };
}
