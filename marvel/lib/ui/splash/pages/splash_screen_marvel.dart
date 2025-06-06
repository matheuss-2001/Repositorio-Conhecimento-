import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel/app/routes/app_routes.dart';

class SplashScreenMarvel extends StatefulWidget {
  const SplashScreenMarvel({Key? key}) : super(key: key);

  @override
  State<SplashScreenMarvel> createState() => _SplashScreenMarvelState();
}

class _SplashScreenMarvelState extends State<SplashScreenMarvel> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.red, body: _buildBody());
  }

  Widget _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'MARVEL',
                  textStyle: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
                  speed: const Duration(milliseconds: 150),
                  cursor: "",
                ),
              ],
              totalRepeatCount: 1,
              displayFullTextOnTap: false,
              stopPauseOnTap: false,
              repeatForever: false,
              onFinished: () {
                Get.offAllNamed(Routes.HOMEMOVIEPAGE);
              },
            ),
          ],
        ),
      ],
    );
  }
}
