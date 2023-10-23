import 'package:coffee_app_new/components/widgets/colors.dart';
import 'package:coffee_app_new/components/widgets/my_bottom_navbar.dart';
import 'package:coffee_app_new/screen/screen_about.dart';
import 'package:coffee_app_new/screen/screen_cart.dart';
import 'package:coffee_app_new/screen/screen_intro.dart';
import 'package:coffee_app_new/screen/screen_shop.dart';
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
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Padding(
              padding: EdgeInsets.all(14.0),
              child: Icon(
                Icons.menu,
                color: Colors.black,
              ),
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: mainbg,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(height: 80),

                // logo
                Image.asset(
                  "assets/images/espresso.png",
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
                    child: const ListTile(
                      leading: Icon(
                        Icons.home,
                      ),
                      title: Text(
                        "Home",
                      ),
                    ),
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
                  child: const Padding(
                    padding: EdgeInsets.only(left: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.info,
                      ),
                      title: Text(
                        "About",
                      ),
                    ),
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
              child: const Padding(
                padding: EdgeInsets.only(left: 25.0, bottom: 25),
                child: ListTile(
                  leading: Icon(
                    Icons.logout,
                  ),
                  title: Text(
                    "Logout",
                  ),
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
