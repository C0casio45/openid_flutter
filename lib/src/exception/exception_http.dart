part of openid_flutter.exceptions;

class ForbiddenException implements Exception {
  late String _message;

  ForbiddenException(
      [String message =
          'The Client sent a request to the User Questioning Polling Endpoint whereas it is configured with a client_notification_endpoint.']) {
    _message = message;
  }

  @override
  String toString() {
    return _message;
  }
}

class UnauthorizedException implements Exception {
  late String _message;

  UnauthorizedException(
      [String message =
          'The Client is not authorized to use the User Questioning API or did not send a valid Access Token.']) {
    _message = message;
  }

  @override
  String toString() {
    return _message;
  }
}

class InvalidRedirectUriException implements Exception {
  late String _message;

  InvalidRedirectUriException(
      [String message = 'The value of one or more redirect_uris is invalid.']) {
    _message = message;
  }

  @override
  String toString() {
    return _message;
  }
}

class TimeoutException implements Exception {
  late String _message;

  TimeoutException(
      [String message =
          'The Questioned User did not answer in the allowed period of time.']) {
    _message = message;
  }

  @override
  String toString() {
    return _message;
  }
}

class NoSuitableMethodException implements Exception {
  late String _message;

  NoSuitableMethodException(
      [String message =
          'There is no Questioning Method suitable with the User Questioning Request. The Openid provider can use this error code when it does not implement mechanisms suitable for the wished AMR or ACR.']) {
    _message = message;
  }

  @override
  String toString() {
    return _message;
  }
}
