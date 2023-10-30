import 'package:coffee_app_new/components/constants/font_style.dart';
import 'package:coffee_app_new/components/model/category_model.dart';
import 'package:coffee_app_new/components/model/coffee_shop.dart';
import 'package:coffee_app_new/components/widgets/categorylist_for_provider.dart';
import 'package:coffee_app_new/components/constants/colors.dart';
import 'package:coffee_app_new/components/widgets/my_textfield.dart';
import 'package:coffee_app_new/db/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddCategoryToDB extends StatefulWidget {
  const AddCategoryToDB({super.key});

  @override
  State<AddCategoryToDB> createState() => _AddCoffeeToDBState();
}

class _AddCoffeeToDBState extends State<AddCategoryToDB> {
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController categoryIdController = TextEditingController();
  final adminAddCatFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShopProvider>(builder: (context, provider, child) {
      var count = provider.categories.length;
      return Scaffold(
        appBar: AppBar(
          backgroundColor: mainTitles,
          title: const Text(
            'Add New Category',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text(
                  'Total: $count',
                ),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: adminAddCatFormKey,
            child: Column(
              children: [
                MyCustomTextField(
                  label: 'Category ID',
                  controller: categoryIdController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a value";
                    } else {
                      for (var element in provider.categories) {
                        if (element.id.toLowerCase() == value.toLowerCase()) {
                          return "This category ID already exists!";
                        }
                      }
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15.0),
                MyCustomTextField(
                  label: 'Category',
                  controller: categoryController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a value";
                    } else {
                      for (var element in provider.categories) {
                        if (element.name.toLowerCase() == value.toLowerCase()) {
                          return "This category already exists!";
                        }
                      }
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: mainTitles),
                  onPressed: () {
                    if (adminAddCatFormKey.currentState!.validate()) {
                      addCategory();
                      provider.getCategoryData();
                    } else {
                      showErrorSnackBar();
                    }
                  },
                  child: const Text('Add Category'),
                ),
                Divider(
                  color: mainTitles,
                ),
                Row(
                  children: [
                    MySubheadings(data: 'Categories'),
                  ],
                ),
                const SizedBox(height: 10),
                const Expanded(
                  child: CategoryList(),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  void showCustomSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Success'),
        backgroundColor: Colors.green,
        margin: EdgeInsets.all(10),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void showErrorSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Enter valid data'),
        backgroundColor: Colors.red,
        margin: EdgeInsets.all(10),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void addCategory() async {
    final categoryId = categoryIdController.text.trim().toUpperCase();
    final categoryname = categoryController.text.trim().toUpperCase();
    final category = CategoryModel(id: categoryId, name: categoryname);
    await addCategoryToDb(categoryId: categoryId, category: category);
    categoryController.clear();
    categoryIdController.clear();
    showCustomSnackBar();
  }
}
