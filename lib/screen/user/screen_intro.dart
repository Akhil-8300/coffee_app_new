import 'package:coffee_app_new/components/constants/colors.dart';
import 'package:coffee_app_new/components/constants/font_style.dart';
import 'package:coffee_app_new/components/constants/strings.dart';
import 'package:coffee_app_new/components/widgets/my_button.dart';
import 'package:coffee_app_new/screen/user/screen_routing.dart';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ScreenIntro extends StatelessWidget {
  const ScreenIntro({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(backgroundColor: mainbg,elevation: 0,
        actions: [
          IconButton(
              onPressed: () async {
                var box = await Hive.openBox('CoffeeBox');
                await box.clear();
                await box.close();
                var box2 = await Hive.openBox('CategoryBox');
                await box2.clear();
                await box2.close();
              },
              icon: const Icon(Icons.delete_forever)),
        ],
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

              // Padding(
              //   padding: EdgeInsets.only(top: 50, left: screenWidth * 0.05),
              //   child: Container(
              //     height: MediaQuery.of(context).size.height * 0.35,
              //     width: (screenWidth * 0.9),
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(10),
              //         color: Colors.white),
              //     child: Padding(
              //       padding: const EdgeInsets.all(10),
              //       child: Column(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           MyHeadings(
              //             data: 'New here??',
              //           ),
              //           Padding(
              //             padding: const EdgeInsets.only(top: 40),
              //             child: Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //               children: [
              //                 GestureDetector(
              //                   onTap: () {
              //                     Navigator.pushReplacement(
              //                         context,
              //                         MaterialPageRoute(
              //                             builder: (ctx) =>
              //                                 const ScreenLogin()));
              //                   },
              //                   child: Column(
              //                     children: [
              //                       const CircleAvatar(
              //                         backgroundImage: AssetImage(
              //                             'assets/gifs/new-user.gif'),
              //                         radius: 65,
              //                       ),
              //                       const SizedBox(height: 15),
              //                       MySubheadings(data: 'No'),
              //                     ],
              //                   ),
              //                 ),
              //                 GestureDetector(
              //                   onTap: () {
              //                     Navigator.pushReplacement(
              //                         context,
              //                         MaterialPageRoute(
              //                             builder: (ctx) =>
              //                                 const ScreenSignup()));
              //                   },
              //                   child: Column(
              //                     children: [
              //                       const CircleAvatar(
              //                         backgroundImage: AssetImage(
              //                             'assets/gifs/existing-user.gif'),
              //                         radius: 65,
              //                       ),
              //                       const SizedBox(height: 15),
              //                       MySubheadings(data: 'Yes'),
              //                     ],
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
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
