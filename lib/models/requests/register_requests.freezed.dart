// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_requests.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RegisterRequests _$RegisterRequestsFromJson(Map<String, dynamic> json) {
  return _RegisterRequests.fromJson(json);
}

/// @nodoc
mixin _$RegisterRequests {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String? get otp => throw _privateConstructorUsedError;

  /// Serializes this RegisterRequests to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RegisterRequests
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegisterRequestsCopyWith<RegisterRequests> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterRequestsCopyWith<$Res> {
  factory $RegisterRequestsCopyWith(
    RegisterRequests value,
    $Res Function(RegisterRequests) then,
  ) = _$RegisterRequestsCopyWithImpl<$Res, RegisterRequests>;
  @useResult
  $Res call({String email, String password, String? otp});
}

/// @nodoc
class _$RegisterRequestsCopyWithImpl<$Res, $Val extends RegisterRequests>
    implements $RegisterRequestsCopyWith<$Res> {
  _$RegisterRequestsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterRequests
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? otp = freezed,
  }) {
    return _then(
      _value.copyWith(
            email:
                null == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String,
            password:
                null == password
                    ? _value.password
                    : password // ignore: cast_nullable_to_non_nullable
                        as String,
            otp:
                freezed == otp
                    ? _value.otp
                    : otp // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RegisterRequestsImplCopyWith<$Res>
    implements $RegisterRequestsCopyWith<$Res> {
  factory _$$RegisterRequestsImplCopyWith(
    _$RegisterRequestsImpl value,
    $Res Function(_$RegisterRequestsImpl) then,
  ) = __$$RegisterRequestsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password, String? otp});
}

/// @nodoc
class __$$RegisterRequestsImplCopyWithImpl<$Res>
    extends _$RegisterRequestsCopyWithImpl<$Res, _$RegisterRequestsImpl>
    implements _$$RegisterRequestsImplCopyWith<$Res> {
  __$$RegisterRequestsImplCopyWithImpl(
    _$RegisterRequestsImpl _value,
    $Res Function(_$RegisterRequestsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegisterRequests
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? otp = freezed,
  }) {
    return _then(
      _$RegisterRequestsImpl(
        email:
            null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                    as String,
        password:
            null == password
                ? _value.password
                : password // ignore: cast_nullable_to_non_nullable
                    as String,
        otp:
            freezed == otp
                ? _value.otp
                : otp // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RegisterRequestsImpl implements _RegisterRequests {
  _$RegisterRequestsImpl({
    required this.email,
    required this.password,
    this.otp,
  });

  factory _$RegisterRequestsImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegisterRequestsImplFromJson(json);

  @override
  final String email;
  @override
  final String password;
  @override
  final String? otp;

  @override
  String toString() {
    return 'RegisterRequests(email: $email, password: $password, otp: $otp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterRequestsImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.otp, otp) || other.otp == otp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, password, otp);

  /// Create a copy of RegisterRequests
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterRequestsImplCopyWith<_$RegisterRequestsImpl> get copyWith =>
      __$$RegisterRequestsImplCopyWithImpl<_$RegisterRequestsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RegisterRequestsImplToJson(this);
  }
}

abstract class _RegisterRequests implements RegisterRequests {
  factory _RegisterRequests({
    required final String email,
    required final String password,
    final String? otp,
  }) = _$RegisterRequestsImpl;

  factory _RegisterRequests.fromJson(Map<String, dynamic> json) =
      _$RegisterRequestsImpl.fromJson;

  @override
  String get email;
  @override
  String get password;
  @override
  String? get otp;

  /// Create a copy of RegisterRequests
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterRequestsImplCopyWith<_$RegisterRequestsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
