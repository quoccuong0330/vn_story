// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoginResponse {
  final String accessToken;
  final String refreshToken;

  LoginResponse(this.accessToken, this.refreshToken);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }

  factory LoginResponse.fromMap(Map<String, dynamic> map) {
    return LoginResponse(
      map['accessToken'] as String,
      map['refreshToken'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginResponse.fromJson(String source) =>
      LoginResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
