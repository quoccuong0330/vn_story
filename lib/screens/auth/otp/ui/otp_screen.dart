import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:vn_story/cubits/cubits.dart';
import 'package:vn_story/models/models.dart';
import 'package:vn_story/models/requests/requests.dart';
import 'package:vn_story/utils/constants/color_palettes.dart';
import 'package:vn_story/utils/helpers/format_time.dart';
import 'package:vn_story/utils/localization/l10n/app_localizations.dart';
import 'package:vn_story/utils/constants/text_styles.dart';
import 'package:vn_story/widgets/buttons/button_primary_custom.dart';
import 'package:vn_story/widgets/dialogs/dialogs_custom.dart';
import 'package:vn_story/widgets/layouts/auth_layout.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.type});
  final String type;

  @override
  State<OtpScreen> createState() => OtpScreenState();
}

class OtpScreenState extends State<OtpScreen> {
  late int timeLeft;
  Timer? _timer;
  String _otp = '';
  bool _isValid = false;
  final double timeCountDown = 300;
  bool _otpWrong = true;
  bool _isProcessing = false;

  @override
  void initState() {
    super.initState();
    timeLeft = (timeCountDown).toInt();
    startTimer(timeLeft);
  }

  @override
  void dispose() {
    _timer?.cancel();
    _otp = "";
    _isValid = false;
    _otpWrong = true;
    _isProcessing = false;
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

  void handleCheckOtpRegister(
    BuildContext context,
    UserCubit cubit,
    String email,
    String password,
  ) async {
    AppResponse res = await cubit.confirmOtp(
      RegisterRequests(email: email, password: password, otp: _otp),
    );

    if (res.success) {
      if (context.mounted) {
        DialogsCustom.showCompleteDialog(context, type: "register");
      }
    } else {
      if (context.mounted) {
        setState(() {
          _otpWrong = false;
        });
      }
    }
  }

  void handleCheckOtpForgot(
    BuildContext context,
    UserCubit cubit,
    String password,
    String rePassword,
  ) async {
    AppResponse res = await cubit.resetPassword(
      ForgotPasswordRequest(
        email: null,
        password: password,
        otp: _otp,
        password2: rePassword,
      ),
    );

    if (res.success) {
      if (context.mounted) {
        DialogsCustom.showCompleteDialog(context, type: "forgot");
      }
    } else {
      if (context.mounted) {
        setState(() {
          _otpWrong = false;
        });
      }
    }
  }

  void handleReSendOTPRegister(
    UserCubit cubit,
    String email,
    String password,
  ) async {
    final res = await cubit.signUpOtp(
      RegisterRequests(email: email, password: password),
    );
    if (res.success) {
      setState(() {
        timeLeft = 300;
        startTimer(timeLeft);
      });
    }
  }

  void handleReSendOTPForgot(UserCubit cubit, String email) async {
    final res = await cubit.forgotOtp(ForgotPasswordRequest(email: email));
    if (res.success) {
      setState(() {
        timeLeft = 300;
        startTimer(timeLeft);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations lang = AppLocalizations.of(context);
    GoRouterState state = GoRouterState.of(context);
    final data = state.extra as Map<String, dynamic>?;
    final cubit = context.read<UserCubit>();
    String email = "";
    String password = "";
    String rePassword = "";

    switch (widget.type) {
      case "register":
        email = data != null ? data['email'] : null;
        password = data != null ? data['password'] : null;
        break;
      case "forgot":
        rePassword = data != null ? data['re_password'] : null;
        password = data != null ? data['password'] : null;
        email = data != null ? data['email'] : null;
        break;
    }

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
                            onTap: () {
                              switch (widget.type) {
                                case "register":
                                  {
                                    handleReSendOTPRegister(
                                      cubit,
                                      email,
                                      password,
                                    );
                                  }
                                case "forgot":
                                  {
                                    handleReSendOTPForgot(cubit, email);
                                  }
                              }
                            },
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
                  isProcessing: _isProcessing,
                  colorBg:
                      _isValid
                          ? primaryColor
                          : Color.lerp(primaryColor, whiteColor, 0.5),
                  title: lang.otpScreenTitle,
                  colorText: whiteColor,
                  onPressed:
                      _isValid
                          ? () {
                            switch (widget.type) {
                              case "register":
                                handleCheckOtpRegister(
                                  context,
                                  cubit,
                                  email,
                                  password,
                                );
                                break;
                              case "forgot":
                                handleCheckOtpForgot(
                                  context,
                                  cubit,
                                  password,
                                  rePassword,
                                );
                                break;
                            }
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
