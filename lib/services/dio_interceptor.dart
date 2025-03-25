import 'package:dio/dio.dart';
import 'package:vn_story/network_service/network_url/app_network_urls.dart';

class DioConfig {
  static Dio createDio() {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: AppNetworkUrls.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );

    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print("Request: ${options.method} ${options.uri}");
          return handler.next(options);
        },
        onResponse: (response, handler) {
          print("Response: ${response.statusCode} - ${response.data}");
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          print("Error: ${e.response?.statusCode} - ${e.message}");
          return handler.next(e);
        },
      ),
    );

    return dio;
  }
}
