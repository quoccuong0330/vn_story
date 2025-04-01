// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserEntityImpl _$$UserEntityImplFromJson(Map<String, dynamic> json) =>
    _$UserEntityImpl(
      email: json['email'] as String,
      fullName: json['fullName'] as String?,
      gender: (json['gender'] as num?)?.toInt(),
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$$UserEntityImplToJson(_$UserEntityImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'fullName': instance.fullName,
      'gender': instance.gender,
      'avatar': instance.avatar,
    };

_$AuthUserImpl _$$AuthUserImplFromJson(Map<String, dynamic> json) =>
    _$AuthUserImpl(
      userEntity: UserEntity.fromJson(
        json['userEntity'] as Map<String, dynamic>,
      ),
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$$AuthUserImplToJson(_$AuthUserImpl instance) =>
    <String, dynamic>{
      'userEntity': instance.userEntity,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
