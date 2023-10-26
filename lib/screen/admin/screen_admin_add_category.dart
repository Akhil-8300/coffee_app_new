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
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShopProvider>(builder: (context, provider, child) {
      var count = provider.categories.length;
      return Scaffold(
        appBar: AppBar(
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
            key: formKey,
            child: Column(
              children: [
                MyCustomTextField(
                    label: 'Category ID', controller: categoryIdController),
                const SizedBox(height: 15.0),
                MyCustomTextField(
                  label: 'Category',
                  controller: categoryController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter a category';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 15.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: mainTitles),
                  onPressed: () {
                    addCategory();
                    provider.getCategoryData();
                    debugPrint('Category added${provider.categories}');
                  },
                  child: const Text('Add Category'),
                ),
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

  void addCategory() async {
    final categoryId = categoryIdController.text.trim();
    final categoryname = categoryController.text.trim();
    final category = CategoryModel(id: categoryId, name: categoryname);
    if (formKey.currentState!.validate()) {
      await addCategoryToDb(categoryId: categoryId, category: category);
      categoryController.clear();
      categoryIdController.clear();
      showCustomSnackBar();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Enter valid data'),
          backgroundColor: Colors.red,
          margin: EdgeInsets.all(10),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }
}
