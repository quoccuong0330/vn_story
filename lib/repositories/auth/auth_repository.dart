import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:vn_story/models/app_response.dart';
import 'package:vn_story/models/requests/forgot_password_request.dart';
import 'package:vn_story/models/requests/login_requests.dart';
import 'package:vn_story/models/requests/register_requests.dart';
import 'package:vn_story/models/user_model.dart';
import 'package:vn_story/repositories/auth/base_auth_repository.dart';
import 'package:vn_story/repositories/core/endpoints.dart';
import 'package:vn_story/utils/dio_client/app_interception.dart';
import 'package:vn_story/utils/dio_client/dio_client.dart';

class AuthRepository extends BaseAuthRepository {
  AuthRepository({required BuildContext context, Dio? dioClient})
    : _dioClient = dioClient ??= DioClient().getInstance(context);

  final Dio _dioClient;

  @override
  Future<AppResponse> getOtpRegister(RegisterRequests req) async {
    final res = await _dioClient.post(
      Endpoints.sendOtpRegister,
      data: req.toJson(),
    );

    if (res.statusCode == 204) {
      return AppResponse(success: true, message: "Success");
    } else {
      return AppResponse(success: false, message: res.data.toString());
    }
  }

  @override
  Future<AppResponse> register(RegisterRequests req) async {
    try {
      final res = await _dioClient.post(Endpoints.register, data: req.toJson());
      if (res.statusCode == 201) {
        AppInterceptors.accessToken = res.data["access"];
        return AppResponse(success: true, message: "success", data: res.data);
      } else {
        return AppResponse(success: false, message: res.data);
      }
    } catch (e) {
      print('Unexpected error: $e');
      return AppResponse(success: false, message: "failed");
    }
  }

  @override
  Future<AppResponse> login(LoginRequest req) async {
    final res = await _dioClient.post(Endpoints.login, data: req.toJson());
    if (res.statusCode == 200) {
      AppInterceptors.accessToken = res.data["access"];
      return AppResponse(success: true, message: "success", data: res.data);
    } else {
      return AppResponse(success: false, message: "failed");
    }
  }

  @override
  Future<UserEntity?> me() async {
    final res = await _dioClient.get(Endpoints.me);
    if (res.statusCode == 200) {
      return UserEntity.fromJson(res.data);
    }

    return null;
  }

  @override
  Future<AppResponse> getOtpForgot(ForgotPasswordRequest req) async {
    try {
      final res = await _dioClient.post(
        Endpoints.sendOtpForgotPassword,
        data: req.toJson(),
      );
      if (res.statusCode == 204) {
        return AppResponse(success: true, message: "success");
      } else {
        return AppResponse(success: false, message: "failed");
      }
    } catch (e) {
      return AppResponse(success: false, message: "failed");
    }
  }

  @override
  Future<AppResponse> resetPassword(ForgotPasswordRequest req) async {
    try {
      final res = await _dioClient.put(
        Endpoints.resetPassword,
        data: req.toJson(),
      );
      if (res.statusCode == 204) {
        return AppResponse(success: true, message: "success");
      } else {
        return AppResponse(success: false, message: "failed");
      }
    } catch (e) {
      return AppResponse(success: false, message: "failed");
    }
  }
}
