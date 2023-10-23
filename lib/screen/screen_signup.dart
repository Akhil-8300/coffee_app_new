
import 'package:coffee_app_new/components/widgets/colors.dart';
import 'package:coffee_app_new/components/widgets/font_style.dart';
import 'package:coffee_app_new/components/widgets/my_button.dart';
import 'package:coffee_app_new/screen/screen_login.dart';
import 'package:flutter/material.dart';

final _usernameController = TextEditingController();
final _passwordController = TextEditingController();
final _rePasswordController = TextEditingController();
final _nameController = TextEditingController();
// final _phoneController = TextEditingController();

class ScreenSignup extends StatelessWidget {
  const ScreenSignup({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: mainbg,
      body: SafeArea(
        child: SingleChildScrollView(
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
                    height: screenHeight * .58,
                    width: screenWidth * 0.9,
                    child: Column(children: [
                      MyHeadings(data: 'Sign Up'),
                      const SizedBox(height: 20),
                      FractionallySizedBox(
                        widthFactor: .8,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _nameController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                label: Text(
                                  'Name',
                                  style: TextStyle(color: textboxlabel),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: _usernameController,
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
                              controller: _passwordController,
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
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: _rePasswordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                label: Text(
                                  'Re-enter Password',
                                  style: TextStyle(color: textboxlabel),
                                ),
                              ),
                            ),
                            MyButton(
                                onPressed: () => Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (ctx) => const ScreenLogin(),
                                      ),
                                    ),
                                data: 'Sign Up'),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Text(
                                    "Already have an account?",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                  InkWell(
                                    onTap: () => Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (ctx) =>
                                                const ScreenLogin())),
                                    child: const Text(
                                      'Login here',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.transparent,
                                        shadows: [
                                          Shadow(
                                            offset: Offset(0, -6),
                                          ),
                                        ],
                                        decoration: TextDecoration.underline,
                                        decorationColor: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
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
