import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_requests.freezed.dart';
part 'register_requests.g.dart';

@freezed
class RegisterRequests with _$RegisterRequests {
  factory RegisterRequests({
    required String email,
    required String password,
    String? otp,
  }) = _RegisterRequests;

  factory RegisterRequests.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestsFromJson(json);
}
