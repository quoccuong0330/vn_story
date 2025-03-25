import 'package:flutter/material.dart';
import 'package:vn_story/utils/constants/asset_constants.dart';
import 'package:vn_story/widgets/custom_widget/title_header.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({super.key, required this.widget, required this.title});

  final Widget widget;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                splashBg,
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(children: [TitleHeader(title: title), widget]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
