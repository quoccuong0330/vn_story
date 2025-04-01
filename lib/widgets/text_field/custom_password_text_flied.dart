import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vn_story/utils/constants/color_palettes.dart';

class CustomPasswordTextFlied extends StatefulWidget {
  CustomPasswordTextFlied({
    super.key,
    this.hintText,
    this.onChange,
    this.focusNode,
    required this.isValid,
  });

  final String? hintText;
  final void Function(String)? onChange;
  final FocusNode? focusNode;
  bool isValid;

  @override
  State<CustomPasswordTextFlied> createState() =>
      _CustomPasswordTextFliedState();
}

class _CustomPasswordTextFliedState extends State<CustomPasswordTextFlied> {
  bool _isShow = false;

  void handleChangeIsShow() {
    setState(() {
      _isShow = !_isShow;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: !_isShow,
      onChanged: widget.onChange,
      focusNode: widget.focusNode,
      cursorColor: primaryColor,
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
          onTap: handleChangeIsShow,
          child: Icon(
            !_isShow ? Icons.remove_red_eye_outlined : CupertinoIcons.eye_slash,
            size: 24.0,
            color: black1Color,
          ),
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(color: gray05Color),
        filled: true,
        fillColor: gray01Color,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.isValid ? gray01Color : stateErrorColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.isValid ? gray01Color : stateErrorColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: stateErrorColor, // Hiển thị viền đỏ khi lỗi
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: stateErrorColor, // Viền đỏ khi focus và lỗi
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
