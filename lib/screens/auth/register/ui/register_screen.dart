import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vn_story/cubits/cubits.dart';
import 'package:vn_story/models/models.dart';
import 'package:vn_story/models/requests/register_requests.dart';
import 'package:vn_story/utils/constants/color_palettes.dart';
import 'package:vn_story/utils/helpers/validate.dart';
import 'package:vn_story/utils/localization/l10n/app_localizations.dart';
import 'package:vn_story/utils/constants/text_styles.dart';
import 'package:vn_story/widgets/buttons/button_primary_custom.dart';
import 'package:vn_story/widgets/layouts/auth_layout.dart';
import 'package:vn_story/widgets/text_field/custom_password_text_flied.dart';
import 'package:vn_story/widgets/text_field/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isValidEmail = true;
  bool _isValidEmailExist = true;
  bool _isValidPassword = true;
  bool _isValidCheckPassword = true;
  bool _isProcessing = false;

  String _email = '';
  String _password = '';
  String _checkPassword = '';

  void handleRegisterByAccount(UserCubit cubit) async {
    setState(() {
      _isValidEmail = Validate.isValidEmail(_email);
      _isValidPassword = Validate.isValidPassword(_password);
      _isValidCheckPassword = Validate.isEqual(_password, _checkPassword);
    });
    if (_isValidEmail && _isValidPassword && _isValidCheckPassword) {
      setState(() {
        _isProcessing = true;
      });
      await Future.delayed(Duration(seconds: 2));

      AppResponse res = (await cubit.signUpOtp(
        RegisterRequests(email: _email, password: _password),
      ));
      setState(() {
        _isProcessing = false;
      });
      if (res.success && context.mounted) {
        context.go(
          '/otp-register',
          extra: {'email': _email, 'password': _password},
        );
      } else {
        setState(() {
          _isValidEmailExist = false;
          _isValidEmail = false;
        });
      }
    }
  }

  void handleOTP(String value) {
    log("$value");
  }

  void handleForgotPassword() {
    log("forgot password");
  }

  void handleLoginNow() {
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UserCubit>();
    AppLocalizations lang = AppLocalizations.of(context);
    return AuthLayout(
      title: lang.registerScreenTitle,
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
              lang.registerScreenEmail,
              style: labelText.copyWith(color: gray08Color),
            ),
            SizedBox(height: 8),
            CustomTextField(
              isValid: _isValidEmail,
              hintText: lang.registerScreenHintEmail,
              onChange: (email) {
                setState(() {
                  _isValidEmail = true;
                  _email = email;
                });
              },
            ),
            _isValidEmail
                ? SizedBox(height: 20)
                : _isValidEmailExist
                ? SizedBox(
                  height: 20,
                  child: Text(
                    lang.registerScreenEmailValid,
                    style: body3Text.copyWith(color: stateErrorColor),
                  ),
                )
                : SizedBox(
                  height: 20,
                  child: Text(
                    lang.registerScreenEmailExist,
                    style: body3Text.copyWith(color: stateErrorColor),
                  ),
                ),
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
              isProcessing: _isProcessing,
              title: lang.registerScreenTitle,
              colorBg: primaryColor,
              colorText: whiteColor,
              onPressed: () => handleRegisterByAccount(cubit),
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  lang.registerScreenHaveAccount,
                  style: normalText.copyWith(color: gray08Color),
                ),
                SizedBox(width: 4),
                GestureDetector(
                  onTap: handleLoginNow,
                  child: Text(
                    lang.registerScreenLoginNow,
                    style: normalText
                        .merge(underlineText)
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
