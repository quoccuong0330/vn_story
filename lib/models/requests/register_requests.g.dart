// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_requests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterRequestsImpl _$$RegisterRequestsImplFromJson(
  Map<String, dynamic> json,
) => _$RegisterRequestsImpl(
  email: json['email'] as String,
  password: json['password'] as String,
  otp: json['otp'] as String?,
);

Map<String, dynamic> _$$RegisterRequestsImplToJson(
  _$RegisterRequestsImpl instance,
) => <String, dynamic>{
  'email': instance.email,
  'password': instance.password,
  'otp': instance.otp,
};
