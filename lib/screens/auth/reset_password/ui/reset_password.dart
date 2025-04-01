import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vn_story/cubits/cubits.dart';
import 'package:vn_story/models/requests/forgot_password_request.dart';
import 'package:vn_story/utils/constants/color_palettes.dart';
import 'package:vn_story/utils/constants/text_styles.dart';
import 'package:vn_story/utils/helpers/validate.dart';
import 'package:vn_story/utils/localization/l10n/app_localizations.dart';
import 'package:vn_story/widgets/buttons/button_primary_custom.dart';
import 'package:vn_story/widgets/layouts/auth_layout.dart';
import 'package:vn_story/widgets/text_field/custom_password_text_flied.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool _isValidPassword = true;
  bool _isValidCheckPassword = true;
  bool _isValidComparePassword = true;

  String _password = '';
  String _checkPassword = '';

  void handleResetPassword(UserCubit cubit, String email) async {
    setState(() {
      _isValidPassword = Validate.isValidPassword(_password);
      _isValidCheckPassword = Validate.isValidPassword(_checkPassword);
      _isValidComparePassword = Validate.isEqual(_password, _checkPassword);
    });
    if (_isValidCheckPassword && _isValidPassword && _isValidComparePassword) {
      context.push(
        '/otp-forgot',
        extra: {
          'password': _password,
          're_password': _checkPassword,
          "email": email,
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UserCubit>();
    AppLocalizations lang = AppLocalizations.of(context);
    GoRouterState state = GoRouterState.of(context);
    final data = state.extra as Map<String, dynamic>?;

    String _email = '';
    _email = data != null ? data['email'] : null;

    return AuthLayout(
      title: lang.forgotScreenResetTitle,
      widget: Container(
        padding: EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              lang.registerScreenPassword,
              style: labelText.copyWith(color: gray08Color),
            ),
            SizedBox(height: 8),
            CustomPasswordTextFlied(
              isValid: _isValidPassword,
              hintText: lang.registerScreenHintPassword,
              onChange: (password) {
                setState(() {
                  _isValidPassword = true;
                  _password = password;
                });
              },
            ),
            _isValidPassword
                ? SizedBox(height: 20)
                : SizedBox(
                  height: 20,
                  child: Text(
                    lang.registerScreenPasswordValid,
                    style: body3Text.copyWith(color: stateErrorColor),
                  ),
                ),
            Text(
              lang.registerScreenCheckedPassword,
              style: labelText.copyWith(color: gray08Color),
            ),
            SizedBox(height: 8),
            CustomPasswordTextFlied(
              isValid: _isValidCheckPassword,
              hintText: lang.registerScreenCheckedPassword,
              onChange: (check) {
                setState(() {
                  _isValidCheckPassword = true;
                  _checkPassword = check;
                });
              },
            ),
            _isValidCheckPassword
                ? SizedBox(height: 32)
                : SizedBox(
                  height: 32,
                  child: Text(
                    lang.registerScreenCheckedPasswordValid,
                    style: body3Text.copyWith(color: stateErrorColor),
                  ),
                ),
            ButtonPrimaryCustom(
              isProcessing: false,
              title: lang.otpScreenTitle,
              colorBg: primaryColor,
              colorText: whiteColor,
              onPressed:
                  _isValidCheckPassword && _isValidPassword
                      ? () => handleResetPassword(cubit, _email)
                      : null,
            ),
          ],
        ),
      ),
    );
  }
}
