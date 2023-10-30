import 'package:coffee_app_new/components/constants/colors.dart';
import 'package:coffee_app_new/components/constants/font_style.dart';
import 'package:coffee_app_new/components/model/category_model.dart';
import 'package:coffee_app_new/components/model/coffee_shop.dart';
import 'package:coffee_app_new/components/widgets/my_textfield.dart';
import 'package:coffee_app_new/db/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenAdminEditCategory extends StatelessWidget {
  final CategoryModel category;
  const ScreenAdminEditCategory({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final provider=Provider.of<CoffeeShopProvider>(context);
    final categoryNameController = TextEditingController(text: category.name);
    final adminEditCatformKey = GlobalKey<FormState>();

    void showSuccessSnackBar() {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Success'),
          backgroundColor: Colors.green,
          margin: EdgeInsets.all(10),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }

    void updateCategoryItem() async {
      final categoryName = categoryNameController.text.toString().toUpperCase();
      final categoryId = category.id;
      final categoryModelData =
          CategoryModel(id: categoryId, name: categoryName);

      if (adminEditCatformKey.currentState!.validate()) {
        await updateCategoryDb(
            categoryId: categoryId, category: categoryModelData);
        showSuccessSnackBar();
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
      debugPrint(categoryName);
    }

    return Consumer<CoffeeShopProvider>(builder: (context, catProvider, child) {
      return Scaffold(
        appBar: AppBar(
          title: const AppBarTitle(),
          backgroundColor: mainTitles,
        ),
        body: SafeArea(
            child: Form(
          key: adminEditCatformKey,
          child: Column(
            children: [
              Center(
                child: MyHeadings(data: 'Category ID: ${category.id}'),
              ),
              const SizedBox(height: 10),
              MyCustomTextField(
                  label: 'Category', controller: categoryNameController),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: mainTitles),
                onPressed: () async {
                  updateCategoryItem();
                  catProvider.getCategoryData();
                },
                icon: Icon(
                  Icons.update,
                  color: white,
                ),
                label: Text(
                  'Update category',
                  style: TextStyle(color: white),
                ),
              ),
            ],
          ),
        )),
      );
    });
  }
}
