import 'dart:io';

import 'package:awesome_app/core/base_object.dart';
import 'package:awesome_app/core/const.dart';
import 'package:awesome_app/core/network/app_exception.dart';
import 'package:awesome_app/core/network/base_response.dart';
import 'package:awesome_app/core/utils/log.dart';
import 'package:dio/dio.dart';

/*  For update FormData // need http_parser package.
   var _formData = FormData.fromMap({
      'name-(whatever backend want)': await MultipartFile.fromFile(file.path, contentType: MediaType.parse("image/png")),
    });
    ApiService.post(url, _formData);
 */

class ApiService {
  // dio instance
  final Dio _dio;

  // injecting dio instance
  ApiService(this._dio);

  // Get:-----------------------------------------------------------------------
  Future<ApiResponse<T>> get<T, K>(String url,
      {BaseObject? baseObject, Map<String, String>? params}) async {
    try {
      Response response = await _dio.get(url, queryParameters: params);
      return _handleResponse<T, K>(response, baseObject);
    } catch (e) {
      return _handleAppException(_handleError(e));
    }
  }

  // Put:-----------------------------------------------------------------------
  Future<ApiResponse<T>> put<T, K>(
    String url, {
    BaseObject? baseObject,
    dynamic body,
    Map<String, dynamic>? params,
  }) async {
    try {
      Response response =
          await _dio.put(url, data: body, queryParameters: params);
      return _handleResponse<T, K>(response, baseObject);
    } catch (e) {
      return _handleAppException(_handleError(e));
    }
  }

  // Post:----------------------------------------------------------------------
  Future<ApiResponse<T>> post<T, K>(
    String url, {
    BaseObject? baseObject,
    dynamic body,
    Map<String, dynamic>? params,
  }) async {
    try {
      Response response =
          await _dio.post(url, data: body, queryParameters: params);
      return _handleResponse<T, K>(response, baseObject);
    } catch (e) {
      return _handleAppException(_handleError(e));
    }
  }

  // Delete:--------------------------------------------------------------------
  Future<ApiResponse<T>> delete<T, K>(
    String url, {
    BaseObject? baseObject,
    Map<String, dynamic>? params,
  }) async {
    try {
      Response response = await _dio
          .delete(url, queryParameters: params)
          .then((response) => response.data);
      return _handleResponse<T, K>(response, baseObject);
    } catch (e) {
      return _handleAppException(_handleError(e));
    }
  }

  ApiResponse<T> _handleResponse<T, K>(
      Response? response, BaseObject? baseObject) {
    final _result = ApiResponse<T>();
    if (response != null && response.statusCode == 200) {
      try {
        _result.success = true;
        _result.parseJson<K>(response.data, baseObject);
      } catch (e) {
        Log.error(e.toString(), error: 'ParseJson ERROR');
        throw AppException(message: 'ParseJson ERROR');
      }
    } else {
      _result.success = false;
      _result.data = null;
      _result.statusCode = SystemCode.UNDEFINED_ERROR;
    }

    return _result;
  }

  ApiResponse<T> _handleAppException<T>(AppException ex) => ApiResponse<T>(
        data: null,
        message: ex.message,
        success: false,
        statusCode: ex.prefix,
      );

  AppException _handleError(dynamic error) {
    if (error is Exception) {
      try {
        if (error is DioError) {
          var _dioError = error;
          if (_dioError.error is SocketException) {
            return NoInternetException();
          } else {
            switch (_dioError.type) {
              case DioErrorType.cancel:
                return RequestCancelledException();
              case DioErrorType.connectTimeout:
                return SendTimeoutException();
              case DioErrorType.other:
                return CustomAppException(
                  error.response!.statusCode!,
                  error.response!.statusMessage!,
                );
              case DioErrorType.receiveTimeout:
                return ReceiveTimeoutException();

              case DioErrorType.sendTimeout:
                return SendTimeoutException();

              case DioErrorType.response:
                switch (error.response!.statusCode) {
                  case 400:
                    return NotFoundException();
                  case 401:
                    return UnauthorisedException();
                  case 403:
                    return ForbiddenException();
                  case 404:
                    return UnexpectedException();
                  case 408:
                    return SendTimeoutException();
                  case 409:
                    return ConflictException();
                  case 500:
                    return InternalSeverErrorException();
                  case 502:
                    return BadGatewayException();
                  case 503:
                    return ServiceUnavailableException();
                  case 504:
                    return GatewayTimeoutException();
                  default:
                    return UnexpectedException();
                }
            }
          }
        }
        return UnexpectedException();
      } catch (_) {
        return UnexpectedException();
      }
    } else {
      if (error.toString().contains('is not a subtype of')) {
        return UnableToProcessException();
      } else {
        return UnexpectedException();
      }
    }
  }

  //
}
