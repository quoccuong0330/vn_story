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
import 'package:vn_story/widgets/layouts/auth_layout.dart';

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

    return AuthLayout(
      widget: Center(child: Text("data")),
      title: lang.dialogOtpTitle,
    );
  }
}
