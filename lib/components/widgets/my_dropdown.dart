import 'package:flutter/material.dart';

List<String> itemCount = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];
String qtyFromDb = '3';

class MyDropDownMenu extends StatefulWidget {
  const MyDropDownMenu({super.key});

  @override
  State<MyDropDownMenu> createState() => _MyDropDownMenuState();
}

class _MyDropDownMenuState extends State<MyDropDownMenu> {
  String dropdownValue = qtyFromDb;
  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      
      width: 75,
      initialSelection: itemCount.first,
      onSelected: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
      },
      dropdownMenuEntries:
          itemCount.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}
