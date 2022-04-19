library openid_flutter.exceptions;

//List of all export files exceptions

part './exception_hightrate.dart';
part './exception_http.dart';
part './exception_registration.dart';
part './exception_request.dart';
part './exception_user.dart';

class OpenIdException implements Exception {
  /// An error name
  final String? _error;

  /// Human-readable text description of the error.
  final String? _error_description;

  /// A URI identifying a human-readable web page with information about the
  /// error, used to provide the client developer with additional information
  /// about the error.
  final String? _error_uri;

  OpenIdException(this._error, this._error_description, this._error_uri) {
    switch (_error) {
      case 'duplicate_requests':
        throw DuplicateRequestException();
      case 'forbidden':
        throw ForbiddenException();
      case 'high_rate_client':
        throw HightRateClientException();
      case 'high_rate_question':
        throw HightRateQuestionException();
      case 'invalid_question_id':
        throw InvalidQuestionIdException();
      case 'invalid_request':
        throw InvalidRequestException();
      case 'no_suitable_method':
        throw NoSuitableMethodException();
      case 'timeout':
        throw TimeoutException();
      case 'unauthorized':
        throw UnauthorizedException();
      case 'unknown_user':
        throw UnknownUserException();
      case 'unreachable_user':
        throw UnreachableUserException();
      case 'user_refused_to_answer':
        throw UserRefusedToAnswerException();
      case 'interaction_required':
        throw InteractionRequiredException();
      case 'login_required':
        throw LoginRequiredException();
      case 'account_selection_required':
        throw AccountSelectionRequiredException();
      case 'consent_required':
        throw ConsentRequiredException();
      case 'invalid_request_uri':
        throw InvalidRequestUriException();
      case 'invalid_request_object':
        throw InvalidRequestObjectException();
      case 'request_not_supported':
        throw RequestNotSupportedException();
      case 'request_uri_not_supported':
        throw RequestUriNotSupportedException();
      case 'registration_not_supported':
        throw RegistrationNotSupportedException();
      case 'invalid_redirect_uri':
        throw InvalidRedirectUriException();
      case 'invalid_client_metadata':
        throw InvalidClientMetadatasException();
      default:
    }
  }
}
