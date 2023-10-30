import 'package:coffee_app_new/components/constants/colors.dart';
import 'package:coffee_app_new/components/model/admin_model.dart';
import 'package:coffee_app_new/components/widgets/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ScreenAdminChangePw extends StatefulWidget {
  const ScreenAdminChangePw({super.key});

  @override
  State<ScreenAdminChangePw> createState() => _ScreenAdminSettingsState();
}

class _ScreenAdminSettingsState extends State<ScreenAdminChangePw> {
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController rePassController = TextEditingController();
  final adminSettingsformKey = GlobalKey<FormState>();
  bool obscureValuePass = true;
  bool obscureValueNewPass = true;
  bool isPasswordEightCharacter = false;
  bool isPasswordHasNumber = false;
  bool isPasswordHasUpperCaseLetter = false;
  bool isPasswordHasLowercaseLetter = false;
  bool isPasswordHasSpecialCharacters = false;

  checkPassword(String password) {
    final numberRegex = RegExp(r'[0-9]');
    final upperCaseRegex = RegExp(r'[A-Z]');
    final lowerCaseRegex = RegExp(r'[a-z]');
    final specialCharcters = RegExp(r'[\^$*.\[\]{}()?\-"!@#%&/\,><:;_~`+='
        "'"
        ']');
    setState(() {
      isPasswordEightCharacter = false;
      if (password.length >= 8) {
        isPasswordEightCharacter = true;
      }
      isPasswordHasNumber = false;
      if (numberRegex.hasMatch(password)) {
        isPasswordHasNumber = true;
      }
      isPasswordHasUpperCaseLetter = false;
      if (upperCaseRegex.hasMatch(password)) {
        isPasswordHasUpperCaseLetter = true;
      }
      isPasswordHasLowercaseLetter = false;
      if (lowerCaseRegex.hasMatch(password)) {
        isPasswordHasLowercaseLetter = true;
      }
      isPasswordHasSpecialCharacters = false;
      if (specialCharcters.hasMatch(password)) {
        isPasswordHasSpecialCharacters = true;
      }
    });
  }

  late Admin admin; // Declare the admin object here

  @override
  void initState() {
    super.initState();
    loadAdmin();
  }

  Future<void> loadAdmin() async {
    final adminBox = await Hive.openBox<Admin>('AdminBox');
    admin = adminBox.get(0)!; // Make sure to handle the possible null value
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Change Password'),
        backgroundColor: mainTitles,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: adminSettingsformKey,
            child: Column(
              children: <Widget>[
                MyCustomTextField(
                  controller: oldPasswordController,
                  label: 'Old Password',
                  obscure: obscureValuePass,
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
                  validator: (value) {
                    if (value != admin.password) {
                      return 'Incorrect old password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                MyCustomTextField(
                  controller: newPasswordController,
                  onChanged: (password) => checkPassword(password),
                  label: 'New Password',
                  obscure: obscureValueNewPass,
                  suffixIcon: IconButton(
                      onPressed: () {
                        newPasswordShow();
                      },
                      icon: Icon(
                        obscureValueNewPass
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: mainTitles,
                      )),
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
                  controller: rePassController,
                  label: 'Re-enter password',
                  validator: (value) {
                    if (newPasswordController.text != value) {
                      return 'Password does not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                //first row
                Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: isPasswordEightCharacter
                            ? Colors.green
                            : Colors.transparent,
                        border: isPasswordEightCharacter
                            ? Border.all(color: Colors.grey.shade400)
                            : Border.all(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text('Contains at least 8 characters')
                  ],
                ),

                //second row
                const SizedBox(height: 10),
                Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: isPasswordHasNumber
                            ? Colors.green
                            : Colors.transparent,
                        border: isPasswordEightCharacter
                            ? Border.all(color: Colors.grey.shade400)
                            : Border.all(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text('Contains at least 1 number')
                  ],
                ),
                const SizedBox(height: 10),
                //third row
                Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: isPasswordHasUpperCaseLetter
                            ? Colors.green
                            : Colors.transparent,
                        border: isPasswordHasUpperCaseLetter
                            ? Border.all(color: Colors.grey.shade400)
                            : Border.all(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text('Contains at least 1 uppercase character')
                  ],
                ),
                const SizedBox(height: 10),
                //forth row
                Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: isPasswordHasLowercaseLetter
                            ? Colors.green
                            : Colors.transparent,
                        border: isPasswordHasLowercaseLetter
                            ? Border.all(color: Colors.grey.shade400)
                            : Border.all(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text('Contains at least 1 lowercase character')
                  ],
                ),
                const SizedBox(height: 10),
                //fifth row
                Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: isPasswordHasSpecialCharacters
                            ? Colors.green
                            : Colors.transparent,
                        border: isPasswordHasSpecialCharacters
                            ? Border.all(color: Colors.grey.shade400)
                            : Border.all(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text('Contains at least 1 special character')
                  ],
                ),

                const SizedBox(height: 50),
                MaterialButton(
                  height: 55,
                  minWidth: double.infinity,
                  color: mainTitles,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () {
                    if (adminSettingsformKey.currentState!.validate()) {
                      _handlePasswordChange();
                    }
                  },
                  child: Text(
                    'CHANGE PASSWORD',
                    style: TextStyle(color: white, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handlePasswordChange() {
    final adminBox = Hive.box<Admin>('adminBox');
    final updatedAdmin =
        Admin(username: admin.username, password: newPasswordController.text);
    adminBox.put(0, updatedAdmin);
    admin = updatedAdmin;
    Navigator.of(context).pop();
  }

  newPasswordShow() {
    setState(() {
      if (obscureValueNewPass == false) {
        obscureValueNewPass = true;
      } else {
        obscureValueNewPass = false;
      }
    });
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
}
