import 'package:awesome_app/core/const.dart';

class AppException implements Exception {
  final String? message;
  int? errorCode;
  final prefix;

  AppException({this.errorCode, this.message, this.prefix});

  String toString() {
    return "$prefix ; code: ${errorCode ?? ''} ; message: $message";
  }
}

class NoInternetException extends AppException {
  NoInternetException()
      : super(
            errorCode: null,
            message: ExceptionConstant.msgNoInternetConnection,
            prefix: 'NoInternetException');
}

class RequestCancelledException extends AppException {
  RequestCancelledException()
      : super(
            errorCode: null,
            message: ExceptionConstant.msgRequestCancelled,
            prefix: 'RequestCancelledException');
}

class ReceiveTimeoutException extends AppException {
  ReceiveTimeoutException() : super();
}

class UnableToProcessException extends AppException {
  UnableToProcessException()
      : super(
            errorCode: null,
            message: ExceptionConstant.msgUnableToProcess,
            prefix: 'UnableToProcessException');
}

/// `400`
class NotFoundException extends AppException {
  NotFoundException()
      : super(
            errorCode: ExceptionConstant.notFound,
            message: ExceptionConstant.msgNotFound,
            prefix: 'NotFoundException');
}

/// `401`
class UnauthorisedException extends AppException {
  UnauthorisedException()
      : super(
            errorCode: ExceptionConstant.unauthorisedRequest,
            message: ExceptionConstant.msgUnauthorisedRequest,
            prefix: 'UnauthorisedException');
}

/// `403`
class ForbiddenException extends AppException {
  ForbiddenException()
      : super(
            errorCode: ExceptionConstant.forbidden,
            message: ExceptionConstant.msgForbiddenRequest,
            prefix: 'ForbiddenException');
}

/// `404`
class UnexpectedException extends AppException {
  UnexpectedException()
      : super(
            errorCode: ExceptionConstant.unexpectedError,
            message: ExceptionConstant.msgUnexpectedError,
            prefix: 'UnexpectedException');
}

/// `408`
class SendTimeoutException extends AppException {
  SendTimeoutException()
      : super(
            errorCode: ExceptionConstant.sendTimeout,
            message: ExceptionConstant.msgSendTimeout,
            prefix: 'SendTimeoutException');
}

/// `409`
class ConflictException extends AppException {
  ConflictException()
      : super(
            errorCode: ExceptionConstant.conflict,
            message: ExceptionConstant.msgConflict,
            prefix: 'ConflictException');
}

/// `500`
class InternalSeverErrorException extends AppException {
  InternalSeverErrorException()
      : super(
            errorCode: ExceptionConstant.internalSeverError,
            message: ExceptionConstant.msgInternalServerError,
            prefix: 'InternalSeverErrorException');
}

/// `502`
class BadGatewayException extends AppException {
  BadGatewayException()
      : super(
            errorCode: ExceptionConstant.badGateway,
            message: ExceptionConstant.msgBadGateway,
            prefix: 'BadGatewayException');
}

/// `503`
class ServiceUnavailableException extends AppException {
  ServiceUnavailableException()
      : super(
            errorCode: ExceptionConstant.serviceUnavailable,
            message: ExceptionConstant.msgServiceUnavailable,
            prefix: 'ServiceUnavailableException');
}

/// `504`
class GatewayTimeoutException extends AppException {
  GatewayTimeoutException()
      : super(
            errorCode: ExceptionConstant.gatewayTimeout,
            message: ExceptionConstant.msgServerGatewayTimeout,
            prefix: 'GatewayTimeoutException');
}

class CustomAppException extends AppException {
  CustomAppException(int code, String message)
      : super(errorCode: code, message: message, prefix: 'CustomAppException');
}
