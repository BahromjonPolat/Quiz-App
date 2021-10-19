import 'dart:async';

import 'package:examtwo/consts/colors.dart';
import 'package:examtwo/screens/home/home_page.dart';
import 'package:examtwo/screens/register_page/register_page.dart';
import 'package:examtwo/widgets/circular_indicator.dart';
import 'package:examtwo/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const RegisterPage(),
        ),
      );
    });

    return Scaffold(
      backgroundColor: colorIndigo,
      body: _buildBody(),
    );
  }

  _buildBody() => Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            setBoldText("Quiz App", color: colorWhite, size: 32.0),
            const SizedBox(height: 24.0),
            showCircularIndicator(16.0),
            const Spacer(),
            setSimpleText("by Bahromjon Po'lat", color: colorGrey),
            const SizedBox(height: 24.0),
          ],
        ),
      );
}
