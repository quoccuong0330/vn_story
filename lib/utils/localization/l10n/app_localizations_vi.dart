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

  @override
  String get loginScreenEmailValid => 'Email không hợp lệ.';

  @override
  String get loginScreenPasswordValid => 'Password không hợp lệ.';

  @override
  String get registerScreenTitle => 'Đăng kí';

  @override
  String get registerScreenEmail => 'Email';

  @override
  String get registerScreenHintEmail => 'Nhập email';

  @override
  String get registerScreenCheckedPassword => 'Nhập lại mật khẩu';

  @override
  String get registerScreenPassword => 'Mật khẩu';

  @override
  String get registerScreenHintPassword => 'Nhập mật khẩu';

  @override
  String get registerScreenHaveAccount => 'Đã có tài khoản?';

  @override
  String get registerScreenLoginNow => 'Đăng nhập ngay';

  @override
  String get registerScreenEmailValid => 'Email không hợp lệ.';

  @override
  String get registerScreenPasswordValid => 'Password không hợp lệ.';

  @override
  String get registerScreenCheckedPasswordValid => 'Mật khẩu nhập lại không giống mật khẩu.';

  @override
  String get dialogOtpTitle => 'Xác minh';

  @override
  String get dialogOtpSubTitle => 'Nhập mã xác minh đã được gởi đến email của bạn';

  @override
  String get dialogOtpNoReceive => 'Không nhận được OTP?';

  @override
  String get dialogOtpResend => 'Gửi lại';
}
