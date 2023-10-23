import 'package:coffee_app_new/components/widgets/colors.dart';
import 'package:coffee_app_new/components/widgets/font_style.dart';
import 'package:coffee_app_new/screen/screen_admin_login.dart';
import 'package:coffee_app_new/screen/screen_login.dart';
import 'package:coffee_app_new/screen/screen_signup.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ScreenIntro extends StatelessWidget {
  const ScreenIntro({super.key});

  @override
  Widget build(BuildContext context) {
    void gotoAdminLogin() {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (ctx) => const ScreenAdminLogin()));
    }

    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 225, 226, 225),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: mainTitles,
            onPressed: gotoAdminLogin,
            child: Icon(
              Icons.admin_panel_settings,
              size: 30,
              color: mainbg,
            ),
          ),
          MySubheadings(data: 'Admin Login'),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
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
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20,top: 5),
                child: Image.asset(
                  'assets/images/espresso.png',
                  height: 180,
                ),
              ),
              const MainHeading(data: 'Coffee App'),
              const Text(
                "How do you like your coffee?",
                style: TextStyle(
                  color: Colors.brown,
                  fontSize: 16,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 50, left: screenWidth * 0.05),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: (screenWidth * 0.9),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyHeadings(
                          data: 'New here??',
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (ctx) =>
                                              const ScreenLogin()));
                                },
                                child: Column(
                                  children: [
                                    const CircleAvatar(
                                      backgroundImage: AssetImage(
                                          'assets/gifs/new-user.gif'),
                                      radius: 65,
                                    ),
                                    const SizedBox(height: 15),
                                    MySubheadings(data: 'No'),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (ctx) =>
                                              const ScreenSignup()));
                                },
                                child: Column(
                                  children: [
                                    const CircleAvatar(
                                      backgroundImage: AssetImage(
                                          'assets/gifs/existing-user.gif'),
                                      radius: 65,
                                    ),
                                    const SizedBox(height: 15),
                                    MySubheadings(data: 'Yes'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
