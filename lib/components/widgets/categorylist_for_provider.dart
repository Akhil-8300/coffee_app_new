import 'package:coffee_app_new/components/constants/colors.dart';
import 'package:coffee_app_new/components/model/category_model.dart';
import 'package:coffee_app_new/components/model/coffee_shop.dart';
import 'package:coffee_app_new/components/widgets/category_tile.dart';
import 'package:coffee_app_new/db/db_helper.dart';
import 'package:coffee_app_new/screen/admin/screen_admin_edit_category.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void popWindow() {
      Navigator.pop(context);
    }

    return Consumer<CoffeeShopProvider>(builder: (context, provider, child) {
      if (provider.categories.isEmpty) {
        provider.getCategoryData();
        return const Center(child: CircularProgressIndicator());
      } else {
        return ListView.builder(
            itemCount: provider.categories.length,
            itemBuilder: (context, index) {
              CategoryModel eachCategory = provider.categories[index];
              return CategoryTile(
                category: eachCategory,
                onEdit: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) =>
                          ScreenAdminEditCategory(category: eachCategory),
                    ),
                  );
                },
                onDelete: () {
                  showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog.adaptive(
                            backgroundColor: mainTitles,
                            content: Text(
                              "Do you want to permenantly delete this item?",
                              style: TextStyle(
                                  color: white, fontWeight: FontWeight.bold),
                            ),
                            actions: [
                              ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: white),
                                onPressed: () async {
                                  await deleteCategoryFromDb(
                                      categoryId: eachCategory.id);
                                  provider.getCategoryData();
                                  popWindow();
                                },
                                icon: const Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                ),
                                label: const Text(
                                  'Yes',
                                  style: TextStyle(color: Colors.green),
                                ),
                              ),
                              ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: white),
                                onPressed: () {
                                  popWindow();
                                },
                                icon: const Icon(
                                  Icons.cancel,
                                  color: Colors.red,
                                ),
                                label: const Text(
                                  'No',
                                  style: TextStyle(color: Colors.red),
                                ),
                              )
                            ],
                          ));
                },
              );
            });
      }
    });
  }
}
