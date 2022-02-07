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
            String logContent = '[${options.method}] ${options.path}';

            /// Handle user token is need or no
            var header = _getHeader();
            if (header.isNotEmpty) {
              options.headers.addAll(header);
            }

            if (options.method == 'GET') {
              logContent += '\nQuery param: ${options.queryParameters}';
            } else {
              logContent += '\nBody: ${options.data}';
            }
            Log.debug(logContent, title: 'onRequest');

            return handler.next(options);
          },
          onResponse: (Response response, ResponseInterceptorHandler handler) {
            Log.debug('${response.data}', title: 'onResponse');
            return handler.next(response);
          },
          onError: (DioError e, ErrorInterceptorHandler handler) {
            Log.error(e, error: 'onError');
            return handler.reject(e);
          },
        ),
      );

    return dio;
  }
}
