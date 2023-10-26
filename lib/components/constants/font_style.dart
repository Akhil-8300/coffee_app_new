// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coffee_app_new/components/constants/colors.dart';
import 'package:flutter/material.dart';

class MyHeadings extends StatelessWidget {
  final String data;
  final Color color = mainTitles;
  final FontWeight fontWeight = FontWeight.w700;
  final double fontsize = 24;
  MyHeadings({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Text(
        data,
        style: TextStyle(
          fontSize: fontsize,
          color: color,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}

class MySubheadings extends StatelessWidget {
  final String data;
  final double fontsize = 16;
  final Color color = subTitles;
  final FontWeight fontWeight = FontWeight.w600;
  MySubheadings({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        fontSize: fontsize,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}

class MainHeading extends StatelessWidget {
  final String data;
  const MainHeading({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        color: mainTitles,
        fontSize: 60,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}

class ButtonTextStyle extends StatelessWidget {
  final String data;
  const ButtonTextStyle({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Coffee Break',
      style: TextStyle(color: white, fontSize: 30, fontWeight: FontWeight.bold),
    );
  }
}

class MenuText extends StatelessWidget {
  final String data;
  const MenuText({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        color: white,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
