import 'package:coffee_app_new/components/constants/colors.dart';
import 'package:coffee_app_new/components/constants/font_style.dart';
import 'package:flutter/material.dart';

class ScreenAdminSettings extends StatelessWidget {
  const ScreenAdminSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainbg,
      appBar: AppBar(
        title: const AppBarTitle(),
        backgroundColor: mainTitles,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.settings,
                    color: mainTitles,
                    size: 25,
                  ),
                  Text(
                    'Admin Settings',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: mainTitles),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
