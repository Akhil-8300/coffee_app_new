import 'package:coffee_app_new/components/model/category_model.dart';
import 'package:coffee_app_new/components/model/coffee_shop.dart';
import 'package:coffee_app_new/components/widgets/category_dropdown_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TempScreenTest extends StatelessWidget {
  const TempScreenTest({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CoffeeShopProvider>(context);
    var selectedCategory = categoryProvider.categories.first;
    return Scaffold(
      body: CustomDropDown(
          categories: categoryProvider.categories,
          selectedCategory: selectedCategory,
          onChanged: (CategoryModel? newCategory) {
            selectedCategory = newCategory!;
          }),
    );
  }
}
