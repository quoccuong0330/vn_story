import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vn_story/utils/color_palettes.dart';
import 'package:vn_story/utils/constants/asset_constants.dart';
import 'package:vn_story/utils/helpers/validate.dart';
import 'package:vn_story/utils/localization/l10n/app_localizations.dart';
import 'package:vn_story/utils/text_styles.dart';
import 'package:vn_story/widgets/buttons/button_primary_custom.dart';
import 'package:vn_story/widgets/text_field/custom_password_text_flied.dart';
import 'package:vn_story/widgets/text_field/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isValidEmail = true;
  bool _isValidPassword = true;
  bool _isValidCheckPassword = true;

  String _email = '';
  String _password = '';
  String _checkPassword = '';

  void handleLoginByAccount() {
    setState(() {
      _isValidEmail = Validate.isValidEmail(_email);
      _isValidPassword = Validate.isValidPassword(_password);
      _isValidCheckPassword = Validate.isEqual(_password, _checkPassword);
    });
  }

  void handleForgotPassword() {
    log("forgot password");
  }

  void handleRegisterNow() {
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations lang = AppLocalizations.of(context);
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              splashBg,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 30),
                          Text(
                            lang.registerScreenTitle,
                            style: secondaryH2Text.copyWith(color: black1Color),
                          ),
                          SizedBox(
                            width: 132,
                            height: 8,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFFFFAE51).withAlpha(255),
                                    Color(0xFFFFE23F).withAlpha(82),
                                    Color(0xFF7EB0FF).withAlpha(5),
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Image.asset(pet_1, height: 142, width: 142),
                    ],
                  ),
                  Container(
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
                            : SizedBox(
                              height: 20,
                              child: Text(
                                lang.registerScreenEmailValid,
                                style: body3Text.copyWith(
                                  color: stateErrorColor,
                                ),
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
                                style: body3Text.copyWith(
                                  color: stateErrorColor,
                                ),
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
                                style: body3Text.copyWith(
                                  color: stateErrorColor,
                                ),
                              ),
                            ),
                        ButtonPrimaryCustom(
                          title: lang.registerScreenTitle,
                          colorBg: primaryColor,
                          colorText: whiteColor,
                          onPressed: handleLoginByAccount,
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
                              onTap: handleRegisterNow,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
