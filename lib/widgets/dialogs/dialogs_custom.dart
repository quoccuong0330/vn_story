import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:vn_story/utils/color_palettes.dart';
import 'package:vn_story/utils/helpers/format_time.dart';
import 'package:vn_story/utils/localization/l10n/app_localizations.dart';
import 'package:vn_story/utils/text_styles.dart';
import 'package:vn_story/widgets/buttons/button_primary_custom.dart';
import 'package:vn_story/widgets/custom_widget/title_header.dart';

class DialogsCustom {
  static final DialogsCustom _instance = DialogsCustom.internal();

  DialogsCustom.internal();

  factory DialogsCustom() => _instance;

  static void showOtpDialog(
    BuildContext context, {
    required double timeCountDown,
    required String title,
    required String subTitle,
    required Function(String) onChange,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return _OtpDialog(
          timeCountDown: timeCountDown,
          title: title,
          subTitle: subTitle,
          onChange: onChange,
        );
      },
    );
  }
}

class _OtpDialog extends StatefulWidget {
  const _OtpDialog({
    required this.timeCountDown,
    required this.title,
    required this.subTitle,
    required this.onChange,
  });

  final double timeCountDown;
  final String title;
  final String subTitle;
  final Function(String) onChange;

  @override
  State<_OtpDialog> createState() => _OtpDialogState();
}

class _OtpDialogState extends State<_OtpDialog> {
  late int timeLeft;
  Timer? _timer;
  String _otp = '';
  bool _isValid = false;

  void startTimer(int duration, Function onTick, Function onComplete) {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeLeft > 0) {
        setState(() {
          onTick(timeLeft);
          timeLeft--;
        });
      } else {
        timer.cancel();
        onComplete();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    timeLeft = (widget.timeCountDown * 60).toInt();
    // startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations lang = AppLocalizations.of(context);

    return Dialog(
      insetPadding: EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFFF1C9), Color(0xFFFFFFFF)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleHeader(title: widget.title),
                IconButton(
                  icon: Icon(Icons.close, size: 24),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),

          Container(
            color: Color(0xFFFEFFFE),
            padding: EdgeInsets.only(left: 16, right: 16, top: 6, bottom: 24),
            child: Column(
              children: [
                Text(
                  widget.subTitle,
                  style: body2Text.copyWith(color: gray08Color),
                ),
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
                    activeColor: accentColor,
                    inactiveColor: gray01Color,
                    selectedColor: accentColor,
                    activeFillColor: gray01Color,
                    inactiveFillColor: gray01Color,
                    selectedFillColor: gray01Color,
                  ),
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(lang.dialogOtpNoReceive),
                      SizedBox(width: 5),
                      Text(
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
                  title: lang.dialogOtpTitle,
                  colorText: whiteColor,
                  onPressed:
                      _isValid
                          ? () {
                            if (_isValid) {
                              Navigator.pop(context);
                              widget.onChange(_otp);
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
    ;
  }
}
