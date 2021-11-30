import 'package:awesome_app/core/utils/log.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static Dio? _dio;

  static Dio getDio() {
    _dio ??= createDio();
    return _dio!;
  }

  static Map<String, String> _getHeader() {
    // return {
    //   "Authorization": kmApiDomain.authorization,
    //   "client-version": kmApiDomain.clientVersion,
    //   "content-type": kmApiDomain.contentType,
    //   "language": getDisplayLanguageCode(kmDisplayLanguage),
    //   "Accept-Encoding": "gzip",
    // };

    return {};
  }

  static Dio createDio() {
    Dio dio;

    var options = BaseOptions(
      receiveDataWhenStatusError: true,
      connectTimeout: 30 * 1000, //60 secs
      receiveTimeout: 30 * 1000,
    );

    dio = Dio(options)
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (RequestOptions options,
              RequestInterceptorHandler handler) async {
            /// Handle user token is need or no
            var _header = _getHeader();
            if (_header.isNotEmpty) {
              options.headers.addAll(_header);
            }
            Log.debug('DIO HELPER ===> on Request');
            Log.debug(_header, title: 'HEADER');
            return handler.next(options);
          },
          onResponse: (Response response, ResponseInterceptorHandler handler) {
            /// Do something with response data.
            Log.debug('DIO HELPER ===> on Response');
            return handler.next(response);
          },
          onError: (DioError e, ErrorInterceptorHandler handler) {
            return handler.reject(e);
          },
        ),
      );

    return dio;
  }
}
