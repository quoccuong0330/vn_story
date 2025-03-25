// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:vn_story/utils/color_palettes.dart';
import 'package:vn_story/utils/text_styles.dart';

class ButtonPrimaryCustom extends StatelessWidget {
  const ButtonPrimaryCustom({
    super.key,
    this.title,
    this.onPressed,
    this.colorBg,
    this.colorText,
  });
  final String? title;
  final void Function()? onPressed;
  final Color? colorBg;
  final Color? colorText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 44,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) {
              return Color.lerp(
                colorBg,
                whiteColor,
                0.2,
              ); // Remove background when disabled
            }
            return colorBg;
          }),
          shadowColor: WidgetStateProperty.all(
            Colors.transparent,
          ), // Remove shadow
          padding: WidgetStateProperty.all(EdgeInsets.zero), // Remove padding
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          ), // No border radius
        ),
        onPressed: onPressed,
        child: Text(title!, style: normalText.copyWith(color: colorText)),
      ),
    );
  }
}
