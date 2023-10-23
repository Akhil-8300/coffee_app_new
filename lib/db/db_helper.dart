import 'dart:convert';

import 'package:coffee_app_new/components/model/category_model.dart';
import 'package:coffee_app_new/components/model/coffee_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

Future<void> addCoffeetoDb(
    {required String productId, required CoffeeModel coffee}) async {
  var coffeebox = await Hive.openBox<CoffeeModel>('CoffeeBox');
  await coffeebox.put(productId, coffee);
}

Future<void> addCategoryToDb(
    {required String categoryId, required CategoryModel category}) async {
  var categoryBox = await Hive.openBox<CategoryModel>('CategoryBox');
  await categoryBox.put(categoryId, category);
}
// //getcoffee can be used later for some other purpose.
// void getCoffee() async {
//   var coffeeBox =  Hive.box<CoffeeModel>('coffeeBox');
//   for (var i = 0; i < coffeeBox.length; i++) {
//     var coffee = coffeeBox.getAt(i) as CoffeeModel;
//     debugPrint(
//         'Coffee Name: ${coffee.name}, Price: \$${coffee.price},Image:${coffee.imagePath}');
//   }
// }

Future<dynamic> pickImage() async {
  final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (pickedFile != null) {
    var imageBytes = await pickedFile.readAsBytes();
    String base64Image = base64Encode(imageBytes);
    debugPrint('PickImage Executed');
    return base64Image;
  }
}

ImageProvider imageProcessor(image) {
  final ImageProvider newImage;
  newImage = (image != 'empty'
      ? MemoryImage(const Base64Decoder().convert(image!))
      : const AssetImage('assets/images/latte.png')) as ImageProvider;
  debugPrint('imageProcessor executed');
  return newImage;
}
