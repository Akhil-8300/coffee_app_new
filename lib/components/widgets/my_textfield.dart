import 'package:coffee_app_new/components/widgets/colors.dart';
import 'package:flutter/material.dart';

class MyCustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  const MyCustomTextField({
    super.key,
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 15),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          focusColor: mainTitles,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          label: Text(
            label,
            style: TextStyle(color: textboxlabel),
          ),
        ),
      ),
    );
  }
}
