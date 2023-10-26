import 'package:coffee_app_new/components/constants/colors.dart';
import 'package:coffee_app_new/components/constants/font_style.dart';
import 'package:coffee_app_new/components/widgets/my_bottom_navbar.dart';
import 'package:coffee_app_new/screen/user/screen_about.dart';
import 'package:coffee_app_new/screen/user/screen_cart.dart';

import 'package:coffee_app_new/screen/user/screen_intro.dart';
import 'package:coffee_app_new/screen/user/screen_shop.dart';

import 'package:flutter/material.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  int _selectedIndex = 0;
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _screens = [
    const ScreenShop(),
    const ScreenCart(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainbg,
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
        title: const AppBarTitle(),
        centerTitle: true,
        backgroundColor: mainTitles,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Icon(
                Icons.menu,
                color: white,
              ),
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: mainTitles,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(height: 80),

                // logo
                Image.asset(
                  "assets/images/logo.png",
                  height: 160,
                ),

                const Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Divider(
                    color: Colors.white,
                  ),
                ),

                // home
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.home,
                        color: white,
                      ),
                      title: const MenuText(data: 'Home'),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // pop drawer
                    Navigator.pop(context);

                    // go to new page
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const ScreenAbout(),
                    //   ),
                    // );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: ListTile(
                        leading: Icon(
                          Icons.account_circle_rounded,
                          color: white,
                        ),
                        title: const MenuText(
                          data: 'Profile',
                        )),
                  ),
                ),
                // about
                GestureDetector(
                  onTap: () {
                    // pop drawer
                    Navigator.pop(context);

                    // go to new page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ScreenAbout(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: ListTile(
                        leading: Icon(
                          Icons.info,
                          color: white,
                        ),
                        title: const MenuText(
                          data: 'App Info',
                        )),
                  ),
                ),
              ],
            ),

            // logout
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (ctx) => const ScreenIntro()));
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 25.0, bottom: 25),
                child: ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: white,
                  ),
                  title: const MenuText(data: 'Logout'),
                ),
              ),
            ),
          ],
        ),
      ),
      body: _screens[_selectedIndex],
    );
  }
}
