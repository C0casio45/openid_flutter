part of openid_flutter;

enum FlowType {
  implicit,
  authorizationCode,
  proofKeyForCodeExchange,
  jwtBearer
}

class Flow {
  /// [type] of the Flow auth
  final FlowType type;

  /// [responseType] is the type of the response
  final String? responseType;

  /// [client] is the client who made the request
  final Client client;

  /// [scopes] are the scopes used in the request
  /// It can be in an openid context
  /// - openid (required; to indicate that the application intends to use OIDC to verify the user's identity)
  /// - profile (so you can personalize the email with the user's name)
  /// - email (so you know where to send the welcome email)
  final List<String> scopes;

  /// [state] is the state of the request
  final String state;

  /// [additionalParameters] is the parameters that can be added to the flow
  final Map<String, String> additionalParameters;

  Flow(this.type, this.responseType, this.client, this.scopes, this.state,
      this.additionalParameters);
}
