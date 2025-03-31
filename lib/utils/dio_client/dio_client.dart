import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:vn_story/repositories/core/endpoints.dart';
import 'package:vn_story/utils/dio_client/app_interception.dart';

class DioClient {
  static DioClient? _singleton;

  static late Dio _dio;

  DioClient._() {
    _dio = createDioClient();
  }

  factory DioClient() {
    return _singleton ??= DioClient._();
  }

  Dio get instance => _dio;

  Dio createDioClient() {
    final dio = Dio(
      BaseOptions(
        baseUrl: Endpoints.baseUrl,
        receiveTimeout: Duration(seconds: 15),
        connectTimeout: Duration(seconds: 15),
        sendTimeout: Duration(seconds: 15),
        headers: {
          Headers.acceptHeader: "application/json",
          Headers.contentTypeHeader: "application/json",
        },
      ),
    );

    dio.interceptors.addAll([
      AppInterceptors(),
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    ]);
    return dio;
  }
}
