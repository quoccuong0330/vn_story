import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:vn_story/utils/color_palettes.dart';
import 'package:vn_story/utils/constants/asset_constants.dart';
import 'package:vn_story/utils/localization/l10n/app_localizations.dart';
import 'package:vn_story/utils/text_styles.dart';
import 'package:vn_story/widgets/buttons/button_icon_custom.dart';
import 'package:vn_story/widgets/buttons/button_primary_custom.dart';
import 'package:vn_story/widgets/text_field/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isRemember = false;

  void handleLoginViaGoogle() {
    log("login via gg");
  }

  void handleLoginViaApple() {
    log("login via Apple");
  }

  void handleLoginByAccount() {
    log("login via account");
  }

  void handleForgotPassword() {
    log("forgot password");
  }

  void handleRegisterNow() {
    log("register");
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
                            lang.loginScreenLogin,
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
                          lang.loginScreenEmail,
                          style: labelText.copyWith(color: gray08Color),
                        ),
                        SizedBox(height: 8),
                        CustomTextField(
                          hintText: lang.loginScreenHintEmail,
                          onChange: (email) {
                            log(email);
                          },
                        ),
                        SizedBox(height: 20),
                        Text(
                          lang.loginScreenPassword,
                          style: labelText.copyWith(color: gray08Color),
                        ),
                        SizedBox(height: 8),
                        CustomTextField(
                          hintText: lang.loginScreenHintPassword,
                          onChange: (password) {
                            log(password);
                          },
                        ),
                        SizedBox(height: 12),
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
                                      color:
                                          _isRemember
                                              ? primaryColor
                                              : whiteColor,
                                      border: Border.all(
                                        width: 1.0,
                                        color: primaryColor,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(4.0),
                                      ),
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
                                    style: normalText.copyWith(
                                      color: gray08Color,
                                    ),
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
                        SizedBox(height: 32),
                        ButtonPrimaryCustom(
                          title: lang.loginScreenLogin,
                          colorBg: primaryColor,
                          colorText: whiteColor,
                          onPressed: handleLoginByAccount,
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
                                    colors: [
                                      Color(0xffAEAEC1),
                                      Color(0xFF52525B),
                                    ],
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
                                    colors: [
                                      Color(0xFF52525B),
                                      Color(0xffAEAEC1),
                                    ],
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
                        Center(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: lang.loginScreenNotHaveAccount,
                                  style: normalText.copyWith(
                                    color: gray08Color,
                                  ),
                                ),
                                WidgetSpan(child: SizedBox(width: 8)),
                                TextSpan(
                                  text: lang.loginScreenRegisterNow,
                                  style: normalText
                                      .merge(underlineText)
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
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
