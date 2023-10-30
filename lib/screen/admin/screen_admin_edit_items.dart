import 'package:coffee_app_new/components/constants/colors.dart';
import 'package:coffee_app_new/components/constants/font_style.dart';
import 'package:coffee_app_new/components/model/coffee_model.dart';
import 'package:coffee_app_new/components/model/coffee_shop.dart';
import 'package:coffee_app_new/components/widgets/my_textfield.dart';
import 'package:coffee_app_new/db/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenAdminEditItems extends StatelessWidget {
  final CoffeeModel coffee;

  const ScreenAdminEditItems({
    Key? key,
    required this.coffee,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController(text: coffee.name);
    final priceController = TextEditingController(text: coffee.price);
    final categoryController = TextEditingController(text: coffee.category);
    final quantityController =
        TextEditingController(text: coffee.quantity.toString());
    final coffeeId = coffee.id;
    var imageData = coffee.imagePath;
    final adminEditItemsformKey = GlobalKey<FormState>();

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

    void updateItems() async {
      final name = nameController.text.trim();
      final category = categoryController.text.trim();
      final price = priceController.text.trim();
      debugPrint(name);
      final quantity = quantityController.text.trim();

      final coffee = CoffeeModel(
        name: name,
        price: price,
        category: category,
        quantity: quantity,
        imagePath: imageData,
        id: coffeeId,
      );

      if (adminEditItemsformKey.currentState!.validate()) {
        await updateItemsDb(productId: coffee.id, coffee: coffee);
        debugPrint('success');
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
    }

    return Consumer<CoffeeShopProvider>(
        builder: (context, coffeeProvider, child) {
      return Scaffold(
        appBar: AppBar(
          title: const AppBarTitle(),
          backgroundColor: mainTitles,
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Form(
                key: adminEditItemsformKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    MyHeadings(data: 'PRODUCT ID: $coffeeId'),
                    const SizedBox(height: 15),
                    InkWell(
                      onTap: () async {
                        imageData = await pickImage();
                        coffeeProvider.getCoffeeData();
                      },
                      child: Image(
                        image: imageProcessor(imageData),
                        height: 220,
                      ),
                    ),
                    const SizedBox(height: 10),
                    MyCustomTextField(
                      label: 'Name',
                      controller: nameController,
                    ),
                    const SizedBox(height: 10),
                    MyCustomTextField(
                        label: 'Price', controller: priceController),
                    const SizedBox(height: 10),
                    MyCustomTextField(
                        label: 'Category', controller: categoryController),
                    const SizedBox(height: 10),
                    MyCustomTextField(
                        label: 'Stock', controller: quantityController),
                    const SizedBox(height: 10),
                    ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: mainTitles),
                        onPressed: () async {
                          updateItems();
                          coffeeProvider.getCoffeeData();
                        },
                        icon: Icon(
                          Icons.update,
                          color: white,
                        ),
                        label: Text(
                          'Update Values',
                          style: TextStyle(color: white),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
