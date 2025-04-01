import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vn_story/blocs/blocs.dart';
import 'package:vn_story/models/models.dart';
import 'package:vn_story/models/requests/requests.dart';
import 'package:vn_story/repositories/auth/auth_repository.dart';

part 'user_state.dart';
part 'user_cubit.freezed.dart';

class UserCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;
  final AuthBloc _authBloc;

  UserCubit({
    required AuthRepository authRepository,
    required AuthBloc authBloc,
  }) : _authRepository = authRepository,
       _authBloc = authBloc,
       super(AuthState.initial());

  Future<AppResponse> signIn(LoginRequest req) async {
    final res = await _authRepository.login(req);
    if (res.success) {
      _authBloc.add(
        Authenticated(
          isAuthenticated: true,
          token: res.data["access"] ?? "",
          user: await me(),
        ),
      );
      await _authBloc.stream.firstWhere((state) => state.isAuthenticated);
    }
    return res;
  }

  Future<UserEntity?> me() async {
    return await _authRepository.me();
  }

  Future<AppResponse> signUpOtp(RegisterRequests req) async {
    final res = await _authRepository.getOtpRegister(req);

    return res;
  }

  Future<AppResponse> confirmOtp(RegisterRequests req) async {
    final res = await _authRepository.register(req);
    if (res.success) {
      _authBloc.add(
        Authenticated(
          isAuthenticated: true,
          token: res.data["access"] ?? "",
          user: await me(),
        ),
      );
      await _authBloc.stream.firstWhere((state) => state.isAuthenticated);
    }
    return res;
  }

  Future<void> signOut() async {
    _authBloc.add(
      Authenticated(isAuthenticated: false, user: null, token: null),
    );
  }

  Future<AppResponse> forgotOtp(ForgotPasswordRequest req) async {
    final res = await _authRepository.getOtpForgot(req);
    log("message ${res.success}");
    return res;
  }

  Future<AppResponse> resetPassword(ForgotPasswordRequest req) async {
    final res = await _authRepository.resetPassword(req);
    log("check");
    return res;
  }
}
