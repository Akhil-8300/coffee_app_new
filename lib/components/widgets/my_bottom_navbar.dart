import 'package:coffee_app_new/components/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  final void Function(int)? onTabChange;
  const MyBottomNavBar({
    super.key,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: GNav(
        onTabChange: (value) => onTabChange!(value),
        color: menuTileInactive,
        activeColor: menuTileActive,
        tabBorderRadius: 24,
        tabBackgroundColor: Colors.grey.shade300,
        tabActiveBorder: Border.all(color: Colors.white),
        gap: 8,
        mainAxisAlignment: MainAxisAlignment.center,
        tabs: const [
          GButton(
            icon: Icons.home,
            iconSize: 30,
            text: 'Shop',
          ),
          GButton(
            icon: Icons.shopping_bag_rounded,
            iconSize: 30,
            text: 'Cart',
          ),
        ],
      ),
    );
  }
}
