import 'package:vn_story/models/app_response.dart';
import 'package:vn_story/models/requests/requests.dart';
import 'package:vn_story/models/user_model.dart';

abstract class BaseAuthRepository {
  Future<AppResponse> login(LoginRequest req);
  Future<AppResponse> getOtpRegister(RegisterRequests req);
  Future<AppResponse> register(RegisterRequests req);
  Future<UserEntity?> me();
  Future<AppResponse> getOtpForgot(ForgotPasswordRequest req);
  Future<AppResponse> resetPassword(ForgotPasswordRequest req);
}
