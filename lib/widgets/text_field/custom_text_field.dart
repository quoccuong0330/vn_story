import 'package:flutter/material.dart';
import 'package:vn_story/utils/color_palettes.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.onChange,
    this.focusNode,
  });

  final String? hintText;
  final void Function(String)? onChange;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChange,
      focusNode: focusNode,
      cursorColor: primaryColor,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: gray05Color),
        filled: true,
        fillColor: gray01Color,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
