// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoginModels {
  final String email;
  final String password;

  LoginModels(this.email, this.password);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory LoginModels.fromMap(Map<String, dynamic> map) {
    return LoginModels(
      map['email'] as String,
      map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModels.fromJson(String source) => LoginModels.fromMap(json.decode(source) as Map<String, dynamic>);
}
