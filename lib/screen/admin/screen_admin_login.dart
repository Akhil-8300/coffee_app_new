// ignore_for_file: unused_local_variable

import 'package:coffee_app_new/components/constants/colors.dart';
import 'package:coffee_app_new/components/constants/font_style.dart';
import 'package:coffee_app_new/components/model/admin_model.dart';
import 'package:coffee_app_new/components/widgets/my_button.dart';
import 'package:coffee_app_new/components/widgets/my_textfield.dart';
import 'package:coffee_app_new/main.dart';
import 'package:coffee_app_new/screen/admin/screen_admin_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenAdminLogin extends StatefulWidget {
  const ScreenAdminLogin({super.key});

  @override
  State<ScreenAdminLogin> createState() => _ScreenAdminLoginState();
}

class _ScreenAdminLoginState extends State<ScreenAdminLogin> {
  final _adminPasswordController = TextEditingController();
  final _adminLoginKey = GlobalKey<FormState>();
  bool _isPasswordVisible = true;
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
                          key: _adminLoginKey,
                          child: Column(
                            children: [
                              const MyCustomTextField(
                                label: 'Username',
                                initialValue: 'Admin',
                                readonly: true,
                              ),
                              MyCustomTextField(
                                obscure: _isPasswordVisible,
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _isPasswordVisible =
                                            !_isPasswordVisible;
                                      });
                                    },
                                    icon: Icon(
                                      _isPasswordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: mainTitles,
                                    )),
                                label: 'Password',
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
                      MyButton(
                          onPressed: () {
                            if (_adminLoginKey.currentState!.validate()) {
                              _loginAdmin();
                            } else {
                              showCustomSnackBarFail('Validation Fail');
                            }
                          },
                          data: 'Login'),
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
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (ctx) => const ScreenAdminDashBoard()),
        (route) => false);
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

  void showCustomSnackBarFail(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _loginAdmin() async {
    final password = _adminPasswordController.text;
    final adminBox = await Hive.openBox<Admin>('AdminBox');
    final admin = adminBox.get(0);
    if (admin != null && admin.password == _adminPasswordController.text) {
      showCustomSnackBarSave();
      _adminPasswordController.clear();
      final sharedPref = await SharedPreferences.getInstance();
      sharedPref.setBool(adminLogStatus, true);
      gotoAdminHome();
    } else {
      showCustomSnackBarFail('Login Failed');
    }
  }
}
