part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    required bool isAuthenticated,
    String? token,
    UserEntity? user,
  }) = _AuthState;
  factory AuthState.initial() {
    return const AuthState(
      isAuthenticated: false,
      token: null,
      user: null,
    );
  }
}
