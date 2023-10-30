import 'package:coffee_app_new/components/constants/colors.dart';
import 'package:coffee_app_new/components/widgets/admin_settings_gridtile.dart';
import 'package:coffee_app_new/main.dart';
import 'package:coffee_app_new/screen/admin/screen_admin_changepw.dart';
import 'package:coffee_app_new/screen/user/screen_routing.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenAdminSettings extends StatelessWidget {
  const ScreenAdminSettings({super.key});

  @override
  Widget build(BuildContext context) {
    void logout() async {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog.adaptive(
                backgroundColor: mainTitles,
                content: Text(
                  'Confirm Logout',
                  style: TextStyle(color: white, fontWeight: FontWeight.bold),
                ),
                actions: [
                  TextButton.icon(
                    label: const Text(
                      'Confirm',
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () async {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => const ScreenLoginRoute()),
                          (route) => false);
                      final sharedPref = await SharedPreferences.getInstance();
                      sharedPref.setBool(adminLogStatus, false);
                    },
                    icon: const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    ),
                  ),
                  TextButton.icon(label: const Text(
                      'Cancel',
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.cancel,
                        color: Colors.red,
                      ))
                ],
              ));
    }

    void gotoChangePw() {
      Navigator.push(context,
          MaterialPageRoute(builder: (ctx) => const ScreenAdminChangePw()));
    }

    List gridItems = [
      AdminSettingsGridTile(
        iconData: Icons.security,
        data: '''Change Password''',
        onTap: gotoChangePw,
      ),
      AdminSettingsGridTile(
        iconData: Icons.logout,
        data: 'Logout',
        onTap: logout,
      )
    ];
    return Scaffold(
      backgroundColor: mainbg,
      appBar: AppBar(
        title: const Text("Admin Settings"),
        backgroundColor: mainTitles,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1 / 1.5,
                crossAxisCount: 2),
            itemCount: gridItems.length,
            itemBuilder: ((context, index) {
              return gridItems[index];
            }),
          ),
        ),
      ),
    );
  }
}
