
import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password_request.freezed.dart';
part 'forgot_password_request.g.dart';

@freezed
class ForgotPasswordRequest with _$ForgotPasswordRequest {
  factory ForgotPasswordRequest({
     String? email,
     String? password,
    String? password2,
    String? otp,
  }) = _ForgotPasswordRequest;
	
  factory ForgotPasswordRequest.fromJson(Map<String, dynamic> json) =>
			_$ForgotPasswordRequestFromJson(json);
}
