// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get loginScreenLogin => 'Đăng nhập';

  @override
  String get loginScreenEmail => 'Email';

  @override
  String get loginScreenHintEmail => 'Nhập email của bạn';

  @override
  String get loginScreenPassword => 'Mật khẩu';

  @override
  String get loginScreenHintPassword => 'Nhập mật khẩu của bạn';

  @override
  String get loginScreenRemember => 'Ghi nhớ';

  @override
  String get loginScreenForgotPassword => 'Quên mật khẩu?';

  @override
  String get loginScreenOtherWay => 'Hoặc đăng nhập bằng';

  @override
  String get loginScreenNotHaveAccount => 'Chưa có tài khoản?';

  @override
  String get loginScreenRegisterNow => 'Đăng kí ngay';
}
