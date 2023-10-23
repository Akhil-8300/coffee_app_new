import 'package:flutter/material.dart';

class AdminScreenInventory extends StatefulWidget {
  const AdminScreenInventory({super.key});

  @override
  State<AdminScreenInventory> createState() => _AdminScreenInventoryState();
}

class _AdminScreenInventoryState extends State<AdminScreenInventory> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return const ListTile();
    });
  }
}
