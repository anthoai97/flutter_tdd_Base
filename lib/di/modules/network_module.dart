import 'package:awesome_app/core/shared_pref/shared_pref_helper.dart';
import 'package:awesome_app/core/utils/log.dart';
import 'package:dio/dio.dart';

abstract class NetWorkModule {
  /// A singleton dio provider.
  ///
  /// Calling it multiple times will return the same instance.

  static Map<String, dynamic> _getHeader() {
    // return {
    //   "Authorization": kmApiDomain.authorization,
    //   "client-version": kmApiDomain.clientVersion,
    //   "content-type": kmApiDomain.contentType,
    //   "language": getDisplayLanguageCode(kmDisplayLanguage),
    //   "Accept-Encoding": "gzip",
    // };

    return {};
  }

  static Dio provideDio(SharedPreferenceHelper sharedPreferenceHelper) {
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

            // Handle user token is need or no
            var headers = _getHeader();

            // Getting token
            var token = await sharedPreferenceHelper.authToken;

            if (token != null) {
              headers.putIfAbsent('Authorization', () => token);
            } else {
              Log.debug('Auth token is null');
            }

            if (headers.isNotEmpty) {
              options.headers.addAll(headers);
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
