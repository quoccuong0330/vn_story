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

  @override
  String get loginScreenEmailValid => 'Email is not valid.';

  @override
  String get loginScreenPasswordValid => 'Password is not valid.';

  @override
  String get registerScreenTitle => 'Register';

  @override
  String get registerScreenEmail => 'Email';

  @override
  String get registerScreenHintEmail => 'Enter your email';

  @override
  String get registerScreenCheckedPassword => 'Enter password again';

  @override
  String get registerScreenPassword => 'Password';

  @override
  String get registerScreenHintPassword => 'Enter password';

  @override
  String get registerScreenHaveAccount => 'You have account?';

  @override
  String get registerScreenLoginNow => 'Login now';

  @override
  String get registerScreenEmailValid => 'Email is not valid.';

  @override
  String get registerScreenPasswordValid => 'Password is not valid.';

  @override
  String get registerScreenCheckedPasswordValid => 'Refill Password is not equal password.';

  @override
  String get dialogOtpTitle => 'Confirm';

  @override
  String get dialogOtpSubTitle => 'Enter your OTP has been send your email';

  @override
  String get dialogOtpNoReceive => 'Not receive OTP';

  @override
  String get dialogOtpResend => 'Resend';
}
