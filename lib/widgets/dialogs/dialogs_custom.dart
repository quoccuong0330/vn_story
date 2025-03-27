import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vn_story/utils/color_palettes.dart';
import 'package:vn_story/utils/constants/asset_constants.dart';
import 'package:vn_story/widgets/buttons/button_primary_custom.dart';

class DialogsCustom {
  static final DialogsCustom _instance = DialogsCustom.internal();

  DialogsCustom.internal();

  factory DialogsCustom() => _instance;

  static void showCompleteDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const _CompleteDialog();
      },
    );
  }
}

class _CompleteDialog extends StatelessWidget {
  const _CompleteDialog();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(tick, width: 60, height: 60, fit: BoxFit.contain),
            const SizedBox(height: 16),
            const Text(
              "Hoàn tất",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Tài khoản của bạn đã được xác nhận!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            ButtonPrimaryCustom(
              title: "Bắt đầu khám phá",
              colorBg: primaryColor,
              colorText: whiteColor,
              onPressed:  () {

                context.push("/login");
              },
            ),
          ],
        ),
      ),
    );
  }
}
