

import 'package:coffee_app_new/components/constants/colors.dart';
import 'package:coffee_app_new/components/model/category_model.dart';
import 'package:coffee_app_new/components/model/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDropDown extends StatelessWidget {
  final String? Function(CategoryModel?)? validator;
  const CustomDropDown({super.key, this.validator});

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShopProvider>(builder: (context, catProvider, child) {
      if (catProvider.categories.isEmpty) {
        catProvider.getCategoryData();
        return const Text('Fetching Data');
      } else {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          child: DropdownButtonFormField<CategoryModel>(
            // hint: Text('-Select-'),
            validator: validator,
            value: catProvider.selectedCategory,
            onChanged: (newSelectedCategory) {
              catProvider.selectedCategory = newSelectedCategory;
              catProvider.getCategoryData();
            },
            items: catProvider.categories.map((CategoryModel category) {
              return DropdownMenuItem<CategoryModel>(
                value: category,
                child: Text(category.name),
              );
            }).toList(),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: subTitles, width: 2),
                  borderRadius: BorderRadius.circular(10)),
              focusColor: mainTitles,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              label: Text(
                'Select Category',
                style: TextStyle(color: textboxlabel),
              ),
            ),
          ),
        );
      }
    });
  }
}
