// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get loginScreenLogin => 'Sign up';

  @override
  String get loginScreenEmail => 'Email';

  @override
  String get loginScreenHintEmail => 'Enter your email';

  @override
  String get loginScreenPassword => 'Password';

  @override
  String get loginScreenHintPassword => 'Enter password';

  @override
  String get loginScreenRemember => 'Remember';

  @override
  String get loginScreenForgotPassword => 'Forgot password?';

  @override
  String get loginScreenOtherWay => 'Or sign up with';

  @override
  String get loginScreenNotHaveAccount => 'Do not have account?';

  @override
  String get loginScreenRegisterNow => 'Register now';
}
