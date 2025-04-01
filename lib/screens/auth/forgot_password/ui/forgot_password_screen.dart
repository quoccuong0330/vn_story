import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vn_story/cubits/user/user_cubit.dart';
import 'package:vn_story/models/requests/forgot_password_request.dart';
import 'package:vn_story/utils/constants/color_palettes.dart';
import 'package:vn_story/utils/constants/text_styles.dart';
import 'package:vn_story/utils/helpers/validate.dart';
import 'package:vn_story/utils/localization/l10n/app_localizations.dart';
import 'package:vn_story/widgets/buttons/button_primary_custom.dart';
import 'package:vn_story/widgets/layouts/auth_layout.dart';
import 'package:vn_story/widgets/text_field/custom_text_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  String _email = "";
  bool _isValidEmail = true;
  bool _isValidExistEmail = true;

  void handleOnChange(String value) {
    setState(() {
      _email = value;
      _isValidEmail = true;
      _isValidExistEmail = true;
    });
  }

  void handleGetOtp(UserCubit userCubit) async {
    setState(() {
      _isValidEmail = Validate.isValidEmail(_email);
    });
    if (_isValidEmail) {
      final res = await userCubit.forgotOtp(
        ForgotPasswordRequest(email: _email),
      );
      if (res.success) {
        context.push("/reset-password", extra: {'email': _email});
      } else {
        setState(() {
          _isValidEmail = false;
          _isValidExistEmail = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations lang = AppLocalizations.of(context);
    UserCubit userCubit = context.read<UserCubit>();
    return AuthLayout(
      title: lang.forgotScreenTittle,
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
              hintText: lang.registerScreenHintEmail,
              isValid: _isValidEmail,
              onChange: (p0) {
                handleOnChange(p0);
              },
            ),
            !_isValidEmail
                ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: Text(
                    _isValidExistEmail
                        ? lang.loginScreenEmailValid
                        : lang.otpScreenEmailDoesNotExist,
                    style: body2Text.copyWith(color: stateErrorColor),
                  ),
                )
                : SizedBox(height: 32),
            ButtonPrimaryCustom(
              isProcessing: false,
              title: lang.continueKey,
              colorBg: primaryColor,
              colorText: whiteColor,
              onPressed:
                  _isValidEmail && _email != ""
                      ? () {
                        handleGetOtp(userCubit);
                      }
                      : null,
            ),
          ],
        ),
      ),
    );
  }
}
