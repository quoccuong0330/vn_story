// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ForgotPasswordRequestImpl _$$ForgotPasswordRequestImplFromJson(
  Map<String, dynamic> json,
) => _$ForgotPasswordRequestImpl(
  email: json['email'] as String?,
  password: json['password'] as String?,
  password2: json['password2'] as String?,
  otp: json['otp'] as String?,
);

Map<String, dynamic> _$$ForgotPasswordRequestImplToJson(
  _$ForgotPasswordRequestImpl instance,
) => <String, dynamic>{
  'email': instance.email,
  'password': instance.password,
  'password2': instance.password2,
  'otp': instance.otp,
};
