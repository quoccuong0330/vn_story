// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:vn_story/utils/constants/color_palettes.dart';
import 'package:vn_story/utils/constants/text_styles.dart';

class ButtonPrimaryCustom extends StatelessWidget {
  const ButtonPrimaryCustom({
    super.key,
    this.title,
    this.onPressed,
    this.colorBg,
    this.colorText,
    required this.isProcessing,
  });
  final String? title;
  final void Function()? onPressed;
  final Color? colorBg;
  final Color? colorText;
  final bool isProcessing;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 44,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) {
              return Color.lerp(colorBg, whiteColor, 0.4);
            }
            return colorBg;
          }),
          shadowColor: WidgetStateProperty.all(Colors.transparent),
          padding: WidgetStateProperty.all(EdgeInsets.zero),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          ),
        ),
        onPressed: isProcessing ? null : onPressed,
        child:
            isProcessing
                ? SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: whiteColor,
                    strokeWidth: 2,
                  ),
                )
                : Text(title!, style: normalText.copyWith(color: colorText)),
      ),
    );
  }
}
