import 'package:dio/dio.dart';
import 'package:vn_story/models/app_response.dart';
import 'package:vn_story/models/requests/login_requests.dart';
import 'package:vn_story/models/requests/register_requests.dart';
import 'package:vn_story/models/user_model.dart';
import 'package:vn_story/repositories/auth/base_auth_repository.dart';
import 'package:vn_story/repositories/core/endpoints.dart';
import 'package:vn_story/utils/dio_client/dio_client.dart';

class AuthRepository extends BaseAuthRepository {
  AuthRepository({Dio? dioClient})
    : _dioClient = dioClient ??= DioClient().instance;

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
        return AppResponse(
          success: true,
          message: "success",
          data: res.data,
          // AuthUser(
          //   userEntity: UserEntity(email: res.data!.email ?? ""),
          //   accessToken: res.data!.accessToken ?? "",
          //   refreshToken: res.data!.refreshToken ?? "",
          // ).toString(),
        );
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
      final resMe = await me();
      return AppResponse(success: true, message: "success", data: res.data);
    } else {
      return AppResponse(success: false, message: "failed");
    }
  }

  @override
  Future<UserEntity?> me() async {
    final res = await _dioClient.get(Endpoints.me);
  }

  @override
  Future<AppResponse<UserEntity?>> loginWithAccessToken() {
    // TODO: implement loginWithAccessToken
    throw UnimplementedError();
  }

  @override
  Future<AppResponse> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
