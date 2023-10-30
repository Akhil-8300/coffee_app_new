import 'package:coffee_app_new/components/constants/colors.dart';
import 'package:flutter/material.dart';

class AdminRevenueScreen extends StatelessWidget {
  const AdminRevenueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainTitles,
        title: Text(
          'Revenue',
          style: TextStyle(color: white),
        ),
      ),
      body: const SafeArea(
          child: Center(
        child: Text('Revenue Page goes here'),
      )),
    );
  }
}
