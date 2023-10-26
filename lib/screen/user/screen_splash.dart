import 'package:coffee_app_new/components/constants/colors.dart';
import 'package:coffee_app_new/components/constants/strings.dart';
import 'package:coffee_app_new/screen/user/screen_intro.dart';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    super.initState();
    _gotoLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            appTitle,
            style: const TextStyle(
                color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
          ),
          Image.asset('assets/gifs/bubble-tea.gif'),
          LoadingAnimationWidget.halfTriangleDot(color: Colors.white, size: 40),
        ],
      )),
      backgroundColor: mainTitles,
    );
  }

  void _gotoLogin() async {
    await Future.delayed(const Duration(seconds: 10));
// ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (ctx) => const ScreenIntro()));
  }
}
