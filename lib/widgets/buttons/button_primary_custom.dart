// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
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
        style: ElevatedButton.styleFrom(backgroundColor: colorBg),
        onPressed: onPressed,
        child: Text(title!, style: normalText.copyWith(color: colorText)),
      ),
    );
  }
}
