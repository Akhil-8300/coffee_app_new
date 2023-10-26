import 'package:coffee_app_new/components/constants/colors.dart';
import 'package:flutter/material.dart';

class AdminGridTile extends StatelessWidget {
  final IconData iconData;
  final String data;
  final VoidCallback onTap;
  const AdminGridTile({super.key, required this.iconData, required this.data, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        width: 70,
        height: 70,
        decoration: BoxDecoration(color: mainTitles,borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: Colors.white,
              size: 40,
            ),
            const SizedBox(height: 10),
            Text(
              data,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
