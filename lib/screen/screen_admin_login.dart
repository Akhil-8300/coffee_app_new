import 'package:coffee_app_new/components/widgets/colors.dart';
import 'package:coffee_app_new/components/widgets/font_style.dart';
import 'package:coffee_app_new/components/widgets/my_button.dart';
import 'package:coffee_app_new/screen/screen_admin_dashboard.dart';
import 'package:flutter/material.dart';

final _adminUsernameController = TextEditingController();
final _adminPasswordController = TextEditingController();

class ScreenAdminLogin extends StatelessWidget {
  const ScreenAdminLogin({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: mainbg,
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/espresso.png',
                    height: 150,
                  ),
                  const MainHeading(data: 'Coffee App'),
                  Text(
                    "How do you like your coffee?",
                    style: TextStyle(
                      color: subTitles,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(35),
                    ),
                    height: screenHeight * .40,
                    width: screenWidth * 0.9,
                    child: Column(children: [
                      MyHeadings(data: 'Admin Login'),
                      const SizedBox(height: 20),
                      FractionallySizedBox(
                        widthFactor: .8,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _adminUsernameController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                label: Text(
                                  'Username',
                                  style: TextStyle(color: textboxlabel),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: _adminPasswordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                label: Text(
                                  'Password',
                                  style: TextStyle(color: textboxlabel),
                                ),
                              ),
                            ),
                            MyButton(
                                onPressed: () => Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) =>
                                            const ScreenAdminDashBoard())),
                                data: 'Login'),
                          ],
                        ),
                      )
                    ]),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
