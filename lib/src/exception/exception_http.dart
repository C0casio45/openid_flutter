part of openid_flutter.exceptions;

class HttpRequestException implements Exception {
  late int _statusCode;
  late String _body;

  HttpRequestException(
      {int statusCode = 400, String body = "Generic error handler"}) {
    _statusCode = statusCode;
    _body = body;

    switch (_statusCode) {
      case 400:
        throw NoSuitableMethodException();
      case 401:
        throw ForbiddenException();
      case 403:
        throw UnauthorizedException();
      case 408:
        throw TimeoutException();
      case 500:
        throw NoSuitableMethodException();
      default:
        throw Exception(
            "An exception has been thrown : Status code not handled ($_statusCode : $_body)");
    }
  }
}

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
