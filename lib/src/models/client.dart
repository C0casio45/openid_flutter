part of openid_flutter.models;

class Client {
  /// [clientId] is the id of the client
  final String clientId;

  /// [clientSecret] is the secret who permits to auth with the Openid Provider
  final String? clientSecret;

  /// The [Issuer] representing the OpenId Provider.
  final Issuer issuer;

  Client(this.issuer, this.clientId, this.clientSecret);
}
