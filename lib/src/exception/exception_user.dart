part of openid_flutter.exceptions;

class UnknownUserException implements Exception {
  late String _message;

  UnknownUserException(
      [String message =
          'The Questioned User mentioned in the user_id attribute of the User Questioning Request is unknown.']) {
    _message = message;
  }

  @override
  String toString() {
    return _message;
  }
}

class UnreachableUserException implements Exception {
  late String _message;

  UnreachableUserException(
      [String message =
          'The Questioned User mentioned in the User Questioning Request (either in the Access Token or in the user_id attribute) is unreachable. The OP can use this error when it does not have a reachability identifier (e.g. MSISDN) for the Question User or when the reachability identifier is not operational (e.g. unsubscribed MSISDN).']) {
    _message = message;
  }

  @override
  String toString() {
    return _message;
  }
}

class UserRefusedToAnswerException implements Exception {
  late String _message;

  UserRefusedToAnswerException(
      [String message =
          'The Questioned User refused to make a statement to the question.']) {
    _message = message;
  }

  @override
  String toString() {
    return _message;
  }
}

class ConsentRequiredException implements Exception {
  late String _message;

  ConsentRequiredException(
      [String message =
          'The Authorization Server requires End-User consent. This error MAY be returned when the prompt parameter value in the Authentication Request is none, but the Authentication Request cannot be completed without displaying a user interface for End-User consent.']) {
    _message = message;
  }

  @override
  String toString() {
    return _message;
  }
}

class AccountSelectionRequiredException implements Exception {
  late String _message;

  AccountSelectionRequiredException(
      [String message =
          'The End-User is REQUIRED to select a session at the Authorization Server. The End-User MAY be authenticated at the Authorization Server with different associated accounts, but the End-User did not select a session. This error MAY be returned when the prompt parameter value in the Authentication Request is none, but the Authentication Request cannot be completed without displaying a user interface to prompt for a session to use.']) {
    _message = message;
  }

  @override
  String toString() {
    return _message;
  }
}

class LoginRequiredException implements Exception {
  late String _message;

  LoginRequiredException(
      [String message =
          'The Authorization Server requires End-User authentication. This error MAY be returned when the prompt parameter value in the Authentication Request is none, but the Authentication Request cannot be completed without displaying a user interface for End-User authentication.']) {
    _message = message;
  }

  @override
  String toString() {
    return _message;
  }
}

class InteractionRequiredException implements Exception {
  late String _message;

  InteractionRequiredException(
      [String message =
          'The Authorization Server requires End-User interaction of some form to proceed. This error MAY be returned when the prompt parameter value in the Authentication Request is none, but the Authentication Request cannot be completed without displaying a user interface for End-User interaction.']) {
    _message = message;
  }

  @override
  String toString() {
    return _message;
  }
}
