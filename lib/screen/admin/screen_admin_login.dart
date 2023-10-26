// ignore_for_file: unused_local_variable

import 'package:coffee_app_new/components/constants/colors.dart';
import 'package:coffee_app_new/components/constants/font_style.dart';
import 'package:coffee_app_new/components/widgets/my_button.dart';
import 'package:coffee_app_new/components/widgets/my_textfield.dart';
import 'package:coffee_app_new/screen/admin/screen_admin_dashboard.dart';
import 'package:flutter/material.dart';

final _adminUsernameController = TextEditingController();
final _adminPasswordController = TextEditingController();
final formkey = GlobalKey<FormState>();
bool obscureValuePass = true;

class ScreenAdminLogin extends StatefulWidget {
  const ScreenAdminLogin({super.key});

  @override
  State<ScreenAdminLogin> createState() => _ScreenAdminLoginState();
}

class _ScreenAdminLoginState extends State<ScreenAdminLogin> {
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
                      color: white, fontSize: 40, fontWeight: FontWeight.bold),
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
                                controller: _adminUsernameController,
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
                                controller: _adminPasswordController,
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
                      MyButton(onPressed: () => _loginAdmin(), data: 'Login'),
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

  void gotoAdminHome() {
    Navigator.push(context,
        MaterialPageRoute(builder: (ctx) => const ScreenAdminDashBoard()));
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

  void _loginAdmin() {
    final username = _adminUsernameController.text.trim();
    final password = _adminPasswordController.text;
    if (formkey.currentState!.validate()) {
      ///todo savetodb()
      showCustomSnackBarSave();
      _adminUsernameController.clear();
      _adminPasswordController.clear();
      gotoAdminHome();
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
