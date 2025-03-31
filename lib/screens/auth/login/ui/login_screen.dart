import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vn_story/cubits/cubits.dart';
import 'package:vn_story/models/models.dart';
import 'package:vn_story/models/requests/requests.dart';
import 'package:vn_story/utils/constants/color_palettes.dart';
import 'package:vn_story/utils/constants/asset_constants.dart';
import 'package:vn_story/utils/localization/l10n/app_localizations.dart';
import 'package:vn_story/utils/constants/text_styles.dart';
import 'package:vn_story/widgets/buttons/button_icon_custom.dart';
import 'package:vn_story/widgets/buttons/button_primary_custom.dart';
import 'package:vn_story/widgets/layouts/auth_layout.dart';
import 'package:vn_story/widgets/text_field/custom_password_text_flied.dart';
import 'package:vn_story/widgets/text_field/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isRemember = false;
  String _email = "";
  String _password = "";
  bool _isValidEmail = true;
  bool _isValidPassword = true;
  bool _isIncorrectAccount = true;

  void handleSignUpByAccount(UserCubit cubit) async {
    AppResponse res = await cubit.signIn(
      LoginRequest(email: _email, password: _password),
    );
    log(res.success.toString());
    if (res.success) {
      context.go("/home");
    } else {}
  }

  void handleLoginViaGoogle() {
    log("login via gg");
  }

  void handleLoginViaApple() {
    log("login via Apple");
  }

  void handleForgotPassword() {
    log("forgot password");
  }

  void handleRegisterNow() {
    log("register");
    context.push("/register");
  }

  void handleChangeIsRemember() {
    setState(() {
      _isRemember = !_isRemember;
    });
    log(_isRemember.toString());
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations lang = AppLocalizations.of(context);
    final cubit = context.read<UserCubit>();
    return AuthLayout(
      title: lang.loginScreenLogin,
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
              lang.loginScreenEmail,
              style: labelText.copyWith(color: gray08Color),
            ),
            SizedBox(height: 8),
            CustomTextField(
              isValid: _isValidEmail,
              hintText: lang.loginScreenHintEmail,
              onChange: (email) {
                setState(() {
                  _isValidEmail = true;
                  _email = email;
                });
              },
            ),
            _isValidEmail
                ? SizedBox(height: 20)
                : Text(
                  lang.loginScreenEmailValid,
                  style: body3Text.copyWith(color: stateErrorColor),
                ),
            Text(
              lang.loginScreenPassword,
              style: labelText.copyWith(color: gray08Color),
            ),
            SizedBox(height: 8),
            CustomPasswordTextFlied(
              isValid: _isValidPassword,
              hintText: lang.loginScreenHintPassword,
              onChange: (password) {
                setState(() {
                  _isValidPassword = true;
                  _password = password;
                });
              },
            ),
            _isValidPassword
                ? SizedBox(height: 20)
                : Text(
                  lang.loginScreenPasswordValid,
                  style: body3Text.copyWith(color: stateErrorColor),
                ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: handleChangeIsRemember,
                  child: Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: _isRemember ? primaryColor : whiteColor,
                          border: Border.all(width: 1.0, color: primaryColor),
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        ),
                        child: Image.asset(
                          checked_password,
                          width: 20,
                          height: 20,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        lang.loginScreenRemember,
                        style: normalText.copyWith(color: gray08Color),
                      ),
                    ],
                  ),
                ),
                Text(
                  lang.loginScreenForgotPassword,
                  style: normalText.merge(underlineText),
                ),
              ],
            ),
            _isIncorrectAccount
                ? SizedBox(height: 32)
                : Text(
                  "Sai tai khoan hoac mat khau",
                  style: body3Text.copyWith(color: stateErrorColor),
                ),
            ButtonPrimaryCustom(
              isProcessing: false,
              title: lang.loginScreenLogin,
              colorBg: primaryColor,
              colorText: whiteColor,
              onPressed: () => handleSignUpByAccount(cubit),
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 23.5,
                  height: 1,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xffAEAEC1), Color(0xFF52525B)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                SizedBox(width: 8),

                Text(
                  lang.loginScreenOtherWay,
                  style: body3Text.copyWith(color: gray07Color),
                ),
                SizedBox(width: 8),
                SizedBox(
                  width: 23.5,
                  height: 1,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF52525B), Color(0xffAEAEC1)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: ButtonIconCustom(
                    onPressed: handleLoginViaGoogle,
                    label: 'Google',
                    icon: gg_icon,
                    colorBg: whiteColor,
                    colorText: black1Color,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ButtonIconCustom(
                    onPressed: handleLoginViaApple,
                    label: 'Apple',
                    icon: apple_icon,
                    colorBg: whiteColor,
                    colorText: black1Color,
                  ),
                ),
              ],
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  lang.loginScreenNotHaveAccount,
                  style: normalText.copyWith(color: gray08Color),
                ),
                SizedBox(width: 4),
                GestureDetector(
                  onTap: handleRegisterNow,
                  child: Text(
                    lang.loginScreenRegisterNow,
                    style: normalText
                        .merge(underlineText)
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
