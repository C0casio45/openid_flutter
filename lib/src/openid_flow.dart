part of openid_flutter;

enum FlowType {
  implicit,
  authorizationCode,
  proofKeyForCodeExchange,
  jwtBearer
}

class Flow {
  final FlowType type;

  final String? responseType;

  final Client client;

  final List<String> scopes;

  final String state;

  final Map<String, String> additionalParameters;

  Flow(
      FlowType this.type,
      String this.responseType,
      Client this.client,
      List<String> this.scopes,
      String this.state,
      Map<String, String> this.additionalParameters);
}
