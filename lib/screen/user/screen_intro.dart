import 'package:coffee_app_new/components/constants/colors.dart';
import 'package:coffee_app_new/components/constants/font_style.dart';
import 'package:coffee_app_new/components/constants/strings.dart';
import 'package:coffee_app_new/components/widgets/my_button.dart';
import 'package:coffee_app_new/screen/user/screen_routing.dart';

import 'package:flutter/material.dart';

class ScreenIntro extends StatelessWidget {
  const ScreenIntro({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(backgroundColor: mainbg,elevation: 0,
        // actions: [
        //   IconButton(
        //       onPressed: () async {
        //         var box = await Hive.openBox('AdminBox');
        //         await box.clear();
        //         await box.close(); 
        //       },
        //       icon: const Icon(Icons.delete_forever)),
        // ],
      ),
      backgroundColor: const Color.fromARGB(255, 225, 226, 225),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.asset(
                      'assets/images/espresso.png',
                      height: 150,
                    ),
                  ),
                  MainHeading(data: appTitle),
                  Text(
                    appSubTitle,
                    style: const TextStyle(
                      color: Colors.brown,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),

             
              Column(
                children: [
                  MyButton(
                      onPressed: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => const ScreenLoginRoute(),
                            ),
                          ),
                      data: "Let's Start")
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
