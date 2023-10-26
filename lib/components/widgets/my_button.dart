import 'package:coffee_app_new/components/constants/colors.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String data;
  const MyButton({
    Key? key,
    required this.onPressed,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: mainTitles,
        ),
        width: screenWidth * 0.8,
        height: screenHeight * 0.07,
        margin: const EdgeInsets.only(top: 15),
        alignment: Alignment.center,
        child: Text(
          data,
          style: TextStyle(
            color: white,
            fontSize: 25,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
