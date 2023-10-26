// ignore_for_file: unused_local_variable

import 'package:coffee_app_new/components/constants/colors.dart';
import 'package:coffee_app_new/components/constants/font_style.dart';
import 'package:coffee_app_new/components/widgets/my_button.dart';
import 'package:coffee_app_new/components/widgets/my_textfield.dart';
import 'package:coffee_app_new/screen/user/screen_login.dart';
import 'package:flutter/material.dart';

class ScreenSignup extends StatefulWidget {
  const ScreenSignup({super.key});

  @override
  State<ScreenSignup> createState() => _ScreenSignupState();
}

class _ScreenSignupState extends State<ScreenSignup> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _rePasswordController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  bool obscureValuePass = true;
  bool obscureValueRepass = true;
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
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    "SIGN UP",
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
                                  label: 'Name',
                                  controller: _nameController,
                                  validator: (value) {
                                    RegExp regx = RegExp(r'^[a-z A-Z]+$');
                                    if (!regx.hasMatch(value as String)) {
                                      return 'Enter valid name';
                                    }
                                    return null;
                                  },
                                ),
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
                                  label: 'Phone Number',
                                  controller: _phoneController,
                                  type: TextInputType.phone,
                                  validator: (value) {
                                    RegExp regx =
                                        RegExp(r'^([987]{1})(\d{1})(\d{8})$');
                                    if (!regx.hasMatch(value as String)) {
                                      return 'Enter valid phone number';
                                    }
                                    return null;
                                  },
                                ),
                                MyCustomTextField(
                                  label: 'Email',
                                  controller: _emailController,
                                  type: TextInputType.emailAddress,
                                  validator: (value) {
                                    RegExp regx = RegExp(
                                        r'^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$');
                                    if (!regx.hasMatch(value as String)) {
                                      return 'Enter valid Email';
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
                                MyCustomTextField(
                                  label: 'Re-Enter Password',
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        rePasswordShow();
                                      },
                                      icon: Icon(
                                        obscureValueRepass
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: mainTitles,
                                      )),
                                  controller: _rePasswordController,
                                  obscure: obscureValueRepass,
                                  validator: (value) {
                                    if (_passwordController.text != value) {
                                      return 'Password not matching';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ],
                            )),
                        MyButton(
                            onPressed: () {
                              _signUpUser();
                             
                            },
                            data: 'Sign Up'),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                "Already have an account?",
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              InkWell(
                                onTap: () => Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) => const ScreenLogin())),
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
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void gotoLogin() {
    Navigator.push(
        context, MaterialPageRoute(builder: (ctx) => const ScreenLogin()));
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

  rePasswordShow() {
    setState(() {
      if (obscureValueRepass == false) {
        obscureValueRepass = true;
      } else {
        obscureValueRepass = false;
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

  void _signUpUser() {
    final name = _nameController.text.trim();
    final username = _usernameController.text.trim();
    final phoneNumber = _phoneController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    final confirmPassword = _rePasswordController.text.trim();
    if (formkey.currentState!.validate()) {
      ///todo savetodb()
      showCustomSnackBarSave();
      _nameController.clear();
      _usernameController.clear();
      _phoneController.clear();
      _emailController.clear();
      _passwordController.clear();
      _rePasswordController.clear();
       gotoLogin();
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
