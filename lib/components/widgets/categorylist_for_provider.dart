import 'package:coffee_app_new/components/model/category_model.dart';
import 'package:coffee_app_new/components/model/coffee_shop.dart';
import 'package:coffee_app_new/components/widgets/category_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShopProvider>(builder: (context, provider, child) {
      if (provider.categories.isEmpty) {
        provider.getCategoryData();
        return const Center(child: CircularProgressIndicator());
      } else {
        return ListView.builder(
            itemCount: provider.categories.length,
            itemBuilder: (context, index) {
              CategoryModel eachCategory = provider.categories[index];
              return CategoryTile(category: eachCategory);
              
            });
            
      }
    });
  }
}
