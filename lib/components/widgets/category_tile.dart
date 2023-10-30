import 'package:coffee_app_new/components/model/category_model.dart';
import 'package:coffee_app_new/components/constants/colors.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final CategoryModel category;
  final void Function()? onEdit;
  final void Function()? onDelete;

  const CategoryTile({
    super.key,
    required this.category,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: coffeeTileBg,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: ListTile(
        leading: Text(category.id),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            category.name.toUpperCase(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        trailing: Wrap(
          children: [
            IconButton(
              onPressed: onEdit,
              icon: Icon(
                Icons.edit,
                color: mainTitles,
              ),
            ),
            IconButton(
              onPressed: onDelete,
              icon: Icon(
                Icons.delete,
                color: mainTitles,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
