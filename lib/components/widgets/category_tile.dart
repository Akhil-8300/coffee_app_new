import 'package:coffee_app_new/components/model/category_model.dart';
import 'package:coffee_app_new/components/constants/colors.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final CategoryModel category;

  const CategoryTile({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: coffeeTileBg,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(left: 25, right: 25, bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      child: ListTile(
        leading: Text(category.id),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            category.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
