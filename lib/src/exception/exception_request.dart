part of openid_flutter.exceptions;

class InvalidRequestException implements Exception {
  late String _message;

  InvalidRequestException(
      [String message =
          'The User Questioning Request is not valid. The request is missing a required parameter, includes an unsupported parameter value (other than grant type), repeats a parameter, includes multiple credentials, utilizes more than one mechanism for authenticating the client, or is otherwise malformed.']) {
    _message = message;
  }

  @override
  String toString() {
    return _message;
  }
}

class DuplicateRequestException implements Exception {
  late String _message;

  DuplicateRequestException(
      [String message =
          'The Client sent simultaneous requests to the User Questioning Polling Endpoint for the same question_id. This error is responded to oldest requests. The last request is processed normally.']) {
    _message = message;
  }

  @override
  String toString() {
    return _message;
  }
}

class InvalidRequestUriException implements Exception {
  late String _message;

  InvalidRequestUriException(
      [String message =
          'The request_uri in the Authorization Request returns an error or contains invalid data.']) {
    _message = message;
  }

  @override
  String toString() {
    return _message;
  }
}

class InvalidRequestObjectException implements Exception {
  late String _message;

  InvalidRequestObjectException(
      [String message =
          'The request parameter contains an invalid Request Object.']) {
    _message = message;
  }

  @override
  String toString() {
    return _message;
  }
}

class RequestNotSupportedException implements Exception {
  late String _message;

  RequestNotSupportedException(
      [String message =
          'The OP does not support use of the request parameter']) {
    _message = message;
  }

  @override
  String toString() {
    return _message;
  }
}

class RequestUriNotSupportedException implements Exception {
  late String _message;

  RequestUriNotSupportedException(
      [String message =
          'The OP does not support use of the request_uri parameter']) {
    _message = message;
  }

  @override
  String toString() {
    return _message;
  }
}
