abstract class SystemCode {
  static const String UNDEFINED_ERROR = 'undefined_error';
  static const String UNAUTHORIZED = 'UNAUTHORIZED';
}

///
abstract class SystemMessage {
  static const String UNDEFINED_ERROR = 'undefined_error';
}

///
abstract class ExceptionConstant {
  static const int notFound = 400;
  static const String msgNotFound = 'Sever not found.' + _plsTryLater;

  static const int unauthorisedRequest = 401;
  static const String msgUnauthorisedRequest =
      'Unauthorised request' + _plsTryLater;

  static const int forbidden = 403;
  static const String msgForbiddenRequest = 'Forbidden request.' + _plsTryLater;

  static const int unexpectedError = 404;
  static const String msgFormatException =
      'Unexpected error occurred' + _plsTryLater;

  static const int sendTimeout = 408;
  static const String msgSendTimeout =
      'Send timeout in connection with server' + _plsTryLater;

  static const int conflict = 409;
  static const String msgConflict = 'Error due to a conflict.' + _plsTryLater;

  static const int internalSeverError = 500;
  static const String msgInternalServerError =
      'Internal server error.' + _plsTryLater;

  static const int badGateway = 502;
  static const String msgBadGateway = 'Bad request.' + _plsTryLater;

  static const int serviceUnavailable = 503;
  static const String msgServiceUnavailable =
      'Service unavailable.' + _plsTryLater;

  static const int gatewayTimeout = 504;
  static const String msgServerGatewayTimeout =
      'Server gateway timeout.' + _plsTryLater;

  static const String msgRequestCancelled = 'Request cancelled.' + _plsTryLater;
  static const String msgUnexpectedError =
      'Unexpected error occurred' + _plsTryLater;
  static const String msgNoInternetConnection =
      'No internet connection' + _plsTryLater;
  static const String msgUnableToProcess =
      'Unable to process the data' + _plsTryLater;
  static const String _plsTryLater = ' Please try later.';
}
