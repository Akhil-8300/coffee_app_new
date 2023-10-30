// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:coffee_app_new/components/constants/colors.dart';

class MyCustomTextField extends StatelessWidget {
  final String label;
  final bool obscure;
  final Widget? suffixIcon;
  final TextInputType? type;
  final void Function()? ontap;
  final String? Function(String?)? validator;
  final void Function(String)?onChanged;
  final TextEditingController? controller;
  final String? initialValue;
  final bool readonly;
  const MyCustomTextField({
    Key? key,
    required this.label,
    this.obscure = false,
    this.suffixIcon,
    this.onChanged,
    this.type,
    this.ontap,
    this.validator,
    this.controller,
    this.initialValue,
    this.readonly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: TextFormField(
        onChanged: onChanged,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        initialValue: initialValue,
        readOnly: readonly,
        onTap: ontap,
        controller: controller,
        validator: validator,
        obscureText: obscure,
        obscuringCharacter: '*',
        keyboardType: type,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: subTitles, width: 2),
              borderRadius: BorderRadius.circular(10)),
          suffixIcon: suffixIcon,
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
