import 'package:vn_story/utils/constants/regex_constants.dart';

class Validate {
  static bool isValidEmail(String email) {
    return RegExp(regexEmail).hasMatch(email);
  }

  static bool isValidPassword(String password) {
    return RegExp(regexPassword).hasMatch(password);
  }

  static bool isEqual(String password, String checkPassword) {
    return RegExp(regexPassword).hasMatch(password)
        ? password == checkPassword
        : false;
  }
}
