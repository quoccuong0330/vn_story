import 'package:flutter/material.dart';
import 'package:vn_story/utils/color_palettes.dart';
import 'package:vn_story/utils/text_styles.dart';

class ButtonIconCustom extends StatelessWidget {
  const ButtonIconCustom({
    super.key,
    required this.label,
    required this.icon,
    required this.colorBg,
    required this.colorText,
    this.onPressed,
  });

  final String label;
  final String icon;
  final Color colorBg;
  final Color colorText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,

      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorBg,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
            side: BorderSide(color: gray05Color, width: 0.5),
          ),
          shadowColor: Colors.transparent,
          elevation: 0,
        ),

        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(icon, height: 24, width: 24, fit: BoxFit.contain),
            SizedBox(width: 8),
            Text(label, style: labelText.copyWith(color: colorText)),
          ],
        ),
      ),
    );
  }
}
