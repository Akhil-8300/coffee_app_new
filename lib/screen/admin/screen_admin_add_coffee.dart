import 'package:coffee_app_new/components/constants/colors.dart';
import 'package:coffee_app_new/components/constants/font_style.dart';
import 'package:coffee_app_new/components/model/category_model.dart';
import 'package:coffee_app_new/components/model/coffee_model.dart';
import 'package:coffee_app_new/components/model/coffee_shop.dart';
import 'package:coffee_app_new/components/widgets/my_textfield.dart';
import 'package:coffee_app_new/db/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

String? image;

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
  String selectedCategoryValue = '';
  final addCoffeeToDbformKey = GlobalKey<FormState>();
    final _key=GlobalKey<FormFieldState>() ;

  @override
  Widget build(BuildContext context) {
    final itemProvider = Provider.of<CoffeeShopProvider>(context);

    return Consumer<CoffeeShopProvider>(builder: (context, provider, child) {
      String selectedCategoryValue = '';
      if (provider.categories.isEmpty) {
        provider.getCategoryData();
        return Scaffold(
          backgroundColor: mainbg,
          appBar: AppBar(
              backgroundColor: mainTitles,
              title: const Text(
                'Add New Item',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )),
          body: SafeArea(
              child: Center(child: MySubheadings(data: 'Fetching Data'))),
        );
      } else {
        provider.selectedCategory = provider.categories.first;
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
              backgroundColor: mainTitles,
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
              key: addCoffeeToDbformKey,
              child: Column(
                children: [
                  MyCustomTextField(
                    label: 'Product Id',
                    controller: productidController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a value";
                      } else {
                        for (var element in itemProvider.shop) {
                          if (element.id.toLowerCase() == value.toLowerCase()) {
                            return "This Product ID already exists!";
                          }
                        }
                      }
                      return null;
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

                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    child: DropdownButtonFormField<CategoryModel>(
                      validator: (value) {
                        if (value == null) {
                          return 'Select Category';
                          }
                          return null;
                      },
                      key: _key,
                      value: provider.categories.first,
                      onChanged: (newSelectedCategory) {
                        if (newSelectedCategory != null) {
                          provider.selectedCategory = newSelectedCategory;
                          selectedCategoryValue = newSelectedCategory.name;
                          categoryController.text = selectedCategoryValue;
                          provider.getCategoryData();
                        }
                      },
                      items: provider.categories.map((CategoryModel category) {
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
                  ),
                
                  MyCustomTextField(
                    label: 'Price',
                    controller: priceController,
                    type: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter a valid Price';
                      }
                      RegExp regx = RegExp(r"^[0-9]+$");
                      if (!regx.hasMatch(value)) {
                        return 'Enter a valid Price';
                      }
                      {
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
                    style:
                        ElevatedButton.styleFrom(backgroundColor: mainTitles),
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
    });
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
    final productId = productidController.text.trim().toUpperCase();
    final name = nameController.text.trim();
    final category = categoryController.text.trim().toUpperCase();
    final price = priceController.text.trim();
    final imagefile = image;
    debugPrint(name);
    final quantity = quantityController.text.trim();
    final coffee = CoffeeModel(
      id: productId,
      name: name,
      price: price,
      category: category,
      imagePath: imagefile,
      quantity: quantity,
    );

    if (addCoffeeToDbformKey.currentState!.validate()) {
      await addCoffeetoDb(productId: productId, coffee: coffee);

      nameController.clear();
      categoryController.clear();
      priceController.clear();
      quantityController.clear();
      productidController.clear();
      _key.currentState!.reset();
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
