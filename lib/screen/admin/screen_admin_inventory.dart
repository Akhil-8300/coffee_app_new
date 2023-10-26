import 'package:coffee_app_new/components/constants/colors.dart';
import 'package:coffee_app_new/components/constants/font_style.dart';
import 'package:coffee_app_new/components/widgets/inventory_items.dart';
import 'package:flutter/material.dart';

class AdminScreenInventory extends StatelessWidget {
  const AdminScreenInventory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const AppBarTitle(),backgroundColor: mainTitles,),
      body: const SafeArea(
        child: InventoryItems(),
      ),
    );
  }
}
