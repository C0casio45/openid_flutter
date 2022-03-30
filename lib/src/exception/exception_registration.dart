part of openid_flutter.exceptions;

class RegistrationUriNotSupportedException implements Exception {
  late String _message;

  RegistrationUriNotSupportedException(
      [String message =
          'The Openid provider does not support use of the registration parameter']) {
    _message = message;
  }

  @override
  String toString() {
    return _message;
  }
}

class RegistrationNotSupportedException implements Exception {
  late String _message;

  RegistrationNotSupportedException(
      [String message =
          'The Openid provider does not support use of the registration parameter']) {
    _message = message;
  }

  @override
  String toString() {
    return _message;
  }
}

class InvalidClientMetadatasException implements Exception {
  late String _message;

  InvalidClientMetadatasException(
      [String message =
          'The value of one of the Client Metadata fields is invalid and the server has rejected this request. Note that an Authorization Server MAY choose to substitute a valid value for any requested parameter of a Client\'s Metadata.']) {
    _message = message;
  }

  @override
  String toString() {
    return _message;
  }
}

class InvalidQuestionIdException implements Exception {
  late String _message;

  InvalidQuestionIdException(
      [String message =
          'The Client sent a request to the User Questioning Polling Endpoint for a question_id that does not exist or is not valid for the requesting Client.']) {
    _message = message;
  }

  @override
  String toString() {
    return _message;
  }
}
