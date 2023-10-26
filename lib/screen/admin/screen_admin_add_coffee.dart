import 'package:coffee_app_new/components/constants/colors.dart';
import 'package:coffee_app_new/components/constants/font_style.dart';
import 'package:coffee_app_new/components/model/coffee_model.dart';
import 'package:coffee_app_new/components/model/coffee_shop.dart';
import 'package:coffee_app_new/components/widgets/my_textfield.dart';
import 'package:coffee_app_new/db/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

late String image;

class AddCoffeeToDB extends StatefulWidget {
  const AddCoffeeToDB({super.key});

  @override
  State<AddCoffeeToDB> createState() => _AddCoffeeToDBState();
}

class _AddCoffeeToDBState extends State<AddCoffeeToDB> {
  final TextEditingController productidController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  // var selectedCategory = null;
  @override
  Widget build(BuildContext context) {
    final itemProvider = Provider.of<CoffeeShopProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: const Text(
        'Add New Item',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              MyCustomTextField(
                label: 'Product Id',
                controller: productidController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter a valid ID';
                  } else {
                    return null;
                  }
                },
              ),
              MyCustomTextField(
                label: 'Name',
                controller: nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter a valid Name';
                  } else {
                    return null;
                  }
                },
              ),

              // CustomDropDown(
              //     categories: categoryProvider.categories,
              //     selectedCategory: selectedCategory,
              //     onChanged: (CategoryModel? newCategory) {
              //       setState(() {
              //         selectedCategory = newCategory!;
              //         debugPrint(selectedCategory.toString());
              //       });
              //     }),
              MyCustomTextField(
                  label: 'Category', controller: categoryController),
              MyCustomTextField(
                label: 'Price',
                controller: priceController,
                type: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter a valid Price';
                  } else {
                    return null;
                  }
                },
              ),
              MyCustomTextField(
                label: 'Quantity',
                controller: quantityController,
                type: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter a valid ID';
                  } else {
                    return null;
                  }
                },
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: subTitles),
                onPressed: () async {
                  image = await pickImage();
                },
                icon: const Icon(Icons.file_open),
                label: const ButtonTextStyle(data: 'Choose Image'),
              ),
              const SizedBox(height: 15.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: mainTitles),
                onPressed: () {
                  addCoffee();
                  itemProvider.getCoffeeData();
                },
                child: const Text('Add Coffee'),
              ),
            ],
          ),
        ),
      ),
    );
  }
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
  void addCoffee() async {
    final productId = productidController.text.trim();
    final name = nameController.text.trim();
    final category = categoryController.text.trim();
    final price = priceController.text.trim();
    final imagefile = image;
    debugPrint(name);
    final quantity = int.parse(quantityController.text.trim());
    final coffee = CoffeeModel(
      id: productId,
      name: name,
      price: price,
      category: category,
      imagePath: imagefile,
      quantity: quantity,
    );

    if (formKey.currentState!.validate()) {
      await addCoffeetoDb(productId: productId, coffee: coffee);
      nameController.clear();
      categoryController.clear();
      priceController.clear();
      quantityController.clear();
      productidController.clear();
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
}
