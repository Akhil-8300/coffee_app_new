import 'package:coffee_app_new/components/constants/colors.dart';
import 'package:coffee_app_new/components/constants/font_style.dart';
import 'package:coffee_app_new/screen/admin/screen_admin_login.dart';
import 'package:coffee_app_new/screen/user/screen_login.dart';
import 'package:coffee_app_new/screen/user/screen_signup.dart';

import 'package:flutter/material.dart';

class ScreenLoginRoute extends StatelessWidget {
  const ScreenLoginRoute({super.key});

  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight =
        MediaQuery.of(context).size.height - AppBar().preferredSize.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainTitles,
        leading: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Image.asset('assets/images/logo.png'),
        ),
        title: const AppBarTitle(),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (ctx) => const ScreenAdminLogin(),
              ),
            ),
            icon: Icon(
              Icons.admin_panel_settings,
              size: 35,
              color: mainbg,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (ctx) =>  const ScreenSignup())),
            child: Container(
              height: screenHeight / 2,
              color: subTitles,
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'NEW USER',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Take me to registration',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (ctx) => const ScreenLogin())),
              child: Container(
                height: screenHeight / 2,
                color: mainTitles,
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'EXISTING USER',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Take me to login',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
