import 'package:flutter/material.dart';
import 'package:vn_story/utils/color_palettes.dart';
import 'package:vn_story/utils/constants/asset_constants.dart';
import 'package:vn_story/utils/text_styles.dart';

class TitleHeader extends StatelessWidget {
  const TitleHeader({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: title,
        style: secondaryH2Text, // ✅ Sử dụng đúng style để đo kích thước
      ),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 70),
            Text(title, style: secondaryH2Text.copyWith(color: black1Color)),
            SizedBox(
              width: textPainter.width,
              height: 8,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFFFAE51).withAlpha(255),
                      Color(0xFFFFE23F).withAlpha(82),
                      Color(0xFF7EB0FF).withAlpha(5),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ],
        ),

        Image.asset(pet_1, height: 142, width: 142),
      ],
    );
  }
}
