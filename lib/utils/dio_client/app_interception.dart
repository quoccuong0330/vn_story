import 'package:dio/dio.dart';
import 'package:vn_story/models/app_response.dart';

class AppInterceptors extends Interceptor {
  static AppInterceptors? _singleton;

  AppInterceptors._internal();

  factory AppInterceptors() {
    return _singleton ??= AppInterceptors._internal();
  }

  String _accessToken = "";
  void updateAccessToken(String acc) {
    _accessToken = acc;
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (_accessToken != "" && _accessToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $_accessToken';
    }

    return handler.next(options); // Tiếp tục gửi request
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print("Response Interceptor: ${response.data}");
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print("Error Interceptor: ${err.message}");

    final errorResponse = Response(
      requestOptions: err.requestOptions,
      statusCode: err.response?.statusCode ?? 500,
      data: err.response?.data,
    );

    return handler.resolve(errorResponse);
  }
}

String getErrorMessage(DioExceptionType errorType, int? statusCode) {
  String errorMessage = "";
  switch (errorType) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      errorMessage = DioErrorMessage.deadlineExceededException;
      break;
    case DioExceptionType.badResponse:
      switch (statusCode) {
        case 400:
          errorMessage = DioErrorMessage.badRequestException;
          break;
        case 401:
          errorMessage = DioErrorMessage.unauthorizedException;
          break;
        case 404:
          errorMessage = DioErrorMessage.notFoundException;
          break;
        case 409:
          errorMessage = DioErrorMessage.conflictException;
          break;
        case 500:
          errorMessage = DioErrorMessage.internalServerErrorException;
          break;
      }
      break;
    case DioExceptionType.cancel:
      break;
    case DioExceptionType.connectionError:
      errorMessage = DioErrorMessage.unexpectedException;
      break;
    case DioExceptionType.badCertificate:
      errorMessage = DioErrorMessage.unexpectedException;

      throw UnimplementedError();
    case DioExceptionType.unknown:
      errorMessage = DioErrorMessage.unexpectedException;

      throw UnimplementedError();
  }
  return errorMessage;
}

class DioErrorMessage {
  static const badRequestException = "Invalid request";
  static const internalServerErrorException =
      "Unknown error occurred, please try again later.";
  static const conflictException = "Conflict occurred";
  static const unauthorizedException = "Access denied";
  static const notFoundException =
      "The requested information could not be found";
  static const unexpectedException = "Unexpected error occurred.";
  static const noInternetConnectionException =
      "No internet connection detected, please try again.";
  static const deadlineExceededException =
      "The connection has timed out, please try again.";
}

Response<dynamic> mapResponseData({
  Response<dynamic>? response,
  required RequestOptions requestOptions,
  String customMessage = "",
  bool isErrorResponse = false,
}) {
  final bool hasResponseData = response?.data != null;

  Map<String, dynamic>? responseData = response?.data;

  if (hasResponseData) {
    responseData!.addAll({
      "statusCode": response?.statusCode,
      "statusMessage": response?.statusMessage,
    });
  }

  return Response(
    requestOptions: requestOptions,
    data:
        hasResponseData
            ? responseData
            : AppResponse(
              message: customMessage,
              success: isErrorResponse ? false : true,
              statusCode: response?.statusCode,
              statusMessage: response?.statusMessage,
            ).toJson((value) => null),
  );
}
