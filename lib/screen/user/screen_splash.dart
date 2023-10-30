import 'package:coffee_app_new/components/constants/colors.dart';
import 'package:coffee_app_new/components/constants/strings.dart';
import 'package:coffee_app_new/main.dart';
import 'package:coffee_app_new/screen/admin/screen_admin_dashboard.dart';
import 'package:coffee_app_new/screen/user/screen_home.dart';
import 'package:coffee_app_new/screen/user/screen_intro.dart';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    super.initState();
    checkAdminLoginStatus();
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

  void _gotoIntro() async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (ctx) => const ScreenIntro()));
  }

  void _gotoUserHome() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (ctx) => const ScreenHome()));
  }

  void _gotoAdminHome() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (ctx) => const ScreenAdminDashBoard()));
  }

  Future<void> checkAdminLoginStatus() async {
    await Future.delayed(const Duration(seconds: 7));
    final sharedPref = await SharedPreferences.getInstance();
    final adminLoginStatus = sharedPref.getBool(adminLogStatus);
    final userLoginStatus = sharedPref.getBool(userLogStatus);
    if (adminLoginStatus == null || adminLoginStatus == false) {
      if (userLoginStatus == null || userLoginStatus == false) {
        _gotoIntro();
      } else {
        _gotoUserHome();
      }
    } else {
      _gotoAdminHome();
    }
  }
}
