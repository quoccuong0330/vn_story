import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:vn_story/repositories/core/endpoints.dart';
import 'package:vn_story/utils/dio_client/app_interception.dart';

class DioClient {
  static DioClient? _singleton;
  static Dio? _dio;

  DioClient._();

  factory DioClient() {
    return _singleton ??= DioClient._();
  }

  Dio getInstance(BuildContext context) {
    return _dio ??= createDioClient(context);
  }

  Dio createDioClient(BuildContext context) {
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
