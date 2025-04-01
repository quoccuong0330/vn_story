import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vn_story/utils/constants/constants.dart';
import 'package:vn_story/utils/localization/l10n/app_localizations.dart';
import 'package:vn_story/widgets/buttons/button_primary_custom.dart';

class DialogsCustom {
  static final DialogsCustom _instance = DialogsCustom.internal();

  DialogsCustom.internal();

  factory DialogsCustom() => _instance;

  static void showCompleteDialog(BuildContext context, {required String type}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return _CompleteDialog(type);
      },
    );
  }
}

class _CompleteDialog extends StatelessWidget {
  final String type;
  const _CompleteDialog(this.type);
  @override
  Widget build(BuildContext context) {
    AppLocalizations lang = AppLocalizations.of(context);
    final textPainter = TextPainter(
      text: TextSpan(text: lang.dialogComplete, style: secondaryH2Text),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();
    return Dialog(
      insetPadding: EdgeInsets.all(16),
      backgroundColor: whiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: [
              Image.asset(tick, width: 120, height: 120, fit: BoxFit.contain),
              const SizedBox(height: 16),
              Text(lang.dialogComplete, style: secondaryH2Text),
              SizedBox(
                width: textPainter.width,
                height: 8,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0x007EB0FF).withAlpha(2),
                        Color(0xFFFFAE51).withAlpha(80),
                        Color(0x007EB0FF).withAlpha(2),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                type == "register"
                    ? lang.dialogTitleRegister
                    : lang.dialogTitleForgot,
                textAlign: TextAlign.center,
                style: body2Text.copyWith(color: gray08Color),
              ),
              const SizedBox(height: 24),
              ButtonPrimaryCustom(
                width: 192,
                isProcessing: false,
                title: type == "register" ? lang.dialogStart : lang.dialogLogin,
                colorBg: primaryColor,
                colorText: whiteColor,
                onPressed: () {
                  switch (type) {
                    case "register":
                      Navigator.pop(context);
                      context.go("/home");
                      break;
                    case "forgot":
                      Navigator.pop(context);
                      context.go("/login");
                      break;
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
