
import 'package:coffee_app_new/components/widgets/colors.dart';
import 'package:flutter/material.dart';

class ScreenAbout extends StatelessWidget {
  const ScreenAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainbg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.grey[900],
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'About',
          style: TextStyle(color: Colors.grey.shade900),
        ),
      ),
      body: const Center(
          child: Text('Coffee Shop')),
    );
  }
}