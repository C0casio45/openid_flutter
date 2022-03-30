part of openid_flutter.exceptions;

class HightRateClientException implements Exception {
  late String _message;

  HightRateClientException(
      [String message =
          'The Client sent requests at a too high rate, amongst all question_id. Information about the allowed and recommended rates can be included in the error_description.']) {
    _message = message;
  }

  @override
  String toString() {
    return _message;
  }
}

class HightRateQuestionException implements Exception {
  late String _message;

  HightRateQuestionException(
      [String message =
          'The Client sent requests at a too high rate for a given question_id. Information about the allowed and recommended rates can be included in the error_description.']) {
    _message = message;
  }

  @override
  String toString() {
    return _message;
  }
}
