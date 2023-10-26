// ignore_for_file: unused_local_variable

import 'package:coffee_app_new/components/constants/colors.dart';
import 'package:coffee_app_new/components/constants/font_style.dart';
import 'package:coffee_app_new/components/widgets/my_button.dart';
import 'package:coffee_app_new/components/widgets/my_textfield.dart';
import 'package:coffee_app_new/screen/user/screen_home.dart';
import 'package:coffee_app_new/screen/user/screen_signup.dart';
import 'package:flutter/material.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenSignupState();
}

class _ScreenSignupState extends State<ScreenLogin> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  final formkey = GlobalKey<FormState>();
  bool obscureValuePass = true;

  @override
  Widget build(BuildContext context) {
    // double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: mainTitles,
        leading: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Image.asset('assets/images/logo.png'),
        ),
        title: const AppBarTitle(),
        centerTitle: true,
      ),
      backgroundColor: subTitles,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                      color: white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: screenWidth * .95,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: white, borderRadius: BorderRadius.circular(19)),
                  child: Column(
                    children: [
                      Form(
                          key: formkey,
                          child: Column(
                            children: [
                              MyCustomTextField(
                                label: 'Username',
                                controller: _usernameController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter username';
                                  }
                                  return null;
                                },
                              ),
                              MyCustomTextField(
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      passwordShow();
                                    },
                                    icon: Icon(
                                      obscureValuePass
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: mainTitles,
                                    )),
                                label: 'Password',
                                obscure: obscureValuePass,
                                controller: _passwordController,
                                validator: (value) {
                                  RegExp regx = RegExp(
                                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                                  if (!regx.hasMatch(value as String)) {
                                    return 'Enter valid password';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ],
                          )),
                      MyButton(
                          onPressed: () => _loginUser(), data: 'Login'),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              "New here?",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            InkWell(
                              onTap: () => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => const ScreenSignup())),
                              child: const Text(
                                'Signup here',
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }



  void gotoHome(){
    Navigator.push(context, MaterialPageRoute(builder: (ctx)=>const ScreenHome()));
  }

  passwordShow() {
    setState(() {
      if (obscureValuePass == false) {
        obscureValuePass = true;
      } else {
        obscureValuePass = false;
      }
    });
  }

  void showCustomSnackBarSave() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Success'),
        backgroundColor: Colors.green,
        margin: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _loginUser() {
    final username = _usernameController.text.trim();
    final password = _passwordController.text;
    if (formkey.currentState!.validate()) {
      ///todo savetodb()
      showCustomSnackBarSave();
      _usernameController.clear();
      _passwordController.clear();
      gotoHome();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Enter valid data'),
          backgroundColor: Colors.red,
          margin: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }
}
