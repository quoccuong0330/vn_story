import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:vn_story/utils/color_palettes.dart';
import 'package:vn_story/utils/helpers/format_time.dart';
import 'package:vn_story/utils/localization/l10n/app_localizations.dart';
import 'package:vn_story/utils/text_styles.dart';
import 'package:vn_story/widgets/buttons/button_primary_custom.dart';
import 'package:vn_story/widgets/dialogs/dialogs_custom.dart';
import 'package:vn_story/widgets/layouts/auth_layout.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => OtpScreenState();
}

class OtpScreenState extends State<OtpScreen> {
  late int timeLeft;
  Timer? _timer;
  String _otp = '';
  bool _isValid = false;
  final double timeCountDown = 10;
  bool _otpWrong = true;

  @override
  void initState() {
    super.initState();
    timeLeft = (timeCountDown).toInt();
    startTimer(timeLeft);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer(int duration) {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeLeft > 0) {
        setState(() {
          timeLeft = timeLeft - 1;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void handleCheckOtp() {
    if (_otp.length == 4) {
      if (true) {
        DialogsCustom.showCompleteDialog(context);
      } else {}
      log(_otp);
    }
  }

  void handleReSendOTP() {
    setState(() {
      timeLeft = 20;
      startTimer(timeLeft);
    });
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations lang = AppLocalizations.of(context);

    return AuthLayout(
      title: lang.otpScreenTitle,
      widget: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            height: 16,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [whiteColor, whiteColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
          ),
          Container(
            color: Color(0xFFFEFFFE),
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                lang.otpScreenSubTitle,
                style: body2Text.copyWith(color: gray08Color),
              ),
            ),
          ),

          Container(
            color: Color(0xFFFEFFFE),
            padding: EdgeInsets.only(left: 16, right: 16, top: 6, bottom: 24),
            child: Column(
              children: [
                SizedBox(height: 16),
                PinCodeTextField(
                  length: 4,
                  appContext: context,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onChanged: (value) {
                    setState(() {
                      _isValid = value.length == 4;
                      _otp = value;
                      _otpWrong = true;
                    });
                  },
                  cursorColor: accentColor,
                  cursorWidth: 1,
                  enableActiveFill: true,
                  hintCharacter: "-",
                  hintStyle: TextStyle(color: accentColor),
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  autoFocus: true,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderWidth: 1,
                    borderRadius: BorderRadius.circular(8),
                    fieldHeight: 60,
                    fieldWidth: 56,
                    activeColor: _otpWrong ? accentColor : stateErrorColor,
                    inactiveColor: gray01Color,
                    selectedColor: _otpWrong ? accentColor : stateErrorColor,
                    activeFillColor: gray01Color,
                    inactiveFillColor: gray01Color,
                    selectedFillColor: gray01Color,
                  ),
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                ),
                _otpWrong
                    ? SizedBox(height: 20)
                    : SizedBox(
                      child: Text(
                        lang.otpScreenWrong,
                        style: body3Text.copyWith(color: stateErrorColor),
                      ),
                    ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(lang.otpScreenNoReceive),
                      SizedBox(width: 5),
                      timeLeft == 0
                          ? GestureDetector(
                            onTap: () => handleReSendOTP(),
                            child: Text(
                              lang.otpScreenResend,
                              style: body3Text.copyWith(color: accentColor),
                            ),
                          )
                          : Text(
                            FormatTime.formatTime(timeLeft),
                            style: TextStyle(color: accentColor),
                          ),
                    ],
                  ),
                ),
                ButtonPrimaryCustom(
                  colorBg:
                      _isValid
                          ? primaryColor
                          : Color.lerp(primaryColor, whiteColor, 0.5),
                  title: lang.otpScreenTitle,
                  colorText: whiteColor,
                  onPressed:
                      _isValid
                          ? () {
                            handleCheckOtp();
                          }
                          : null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
