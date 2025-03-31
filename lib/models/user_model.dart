import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserEntity with _$UserEntity {
  factory UserEntity({
    required String email,
    String? fullName,
    int? gender,
    String? avatar,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
}

@freezed
class AuthUser with _$AuthUser {
  factory AuthUser({
    required UserEntity userEntity,
    required String accessToken,
    required String refreshToken,
  }) = _AuthUser;
  factory AuthUser.fromJson(Map<String, dynamic> json) =>
      _$AuthUserFromJson(json);
}
