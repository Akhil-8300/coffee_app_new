import 'dart:convert';

import 'package:coffee_app_new/components/model/admin_model.dart';
import 'package:coffee_app_new/components/model/category_model.dart';
import 'package:coffee_app_new/components/model/coffee_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

//Products Table

Future<void> addCoffeetoDb(
    {required String productId, required CoffeeModel coffee}) async {
  var coffeebox = await Hive.openBox<CoffeeModel>('CoffeeBoxNew');
  await coffeebox.put(productId, coffee);
}

Future<void> updateItemsDb(
    {required String productId, required CoffeeModel coffee}) async {
  var coffeebox = await Hive.openBox<CoffeeModel>('CoffeeBoxNew');
  await coffeebox.put(productId, coffee);
}

Future<void> deleteItemFromDb({required String productId}) async {
  var coffeebox = await Hive.openBox<CoffeeModel>('CoffeeBoxNew');
  await coffeebox.delete(productId);
  debugPrint('deleted');
}

//Category Table

Future<void> addCategoryToDb(
    {required String categoryId, required CategoryModel category}) async {
  var categoryBox = await Hive.openBox<CategoryModel>('CategoryBoxNew');
  await categoryBox.put(categoryId, category);
}

Future<void> updateCategoryDb(
    {required String categoryId, required CategoryModel category}) async {
  var categoryBox = await Hive.openBox<CategoryModel>('CategoryBoxNew');
  await categoryBox.put(categoryId, category);
  debugPrint('call received$categoryId');
}

Future<void> deleteCategoryFromDb({required String categoryId}) async {
  var categoryBox = await Hive.openBox<CategoryModel>('CategoryBoxNew');
  await categoryBox.delete(categoryId);
  debugPrint('deleted');
}


//Image Processing

Future<dynamic> pickImage() async {
  final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (pickedFile != null) {
    var imageBytes = await pickedFile.readAsBytes();
    String base64Image = base64Encode(imageBytes);
    debugPrint('PickImage Executed');
    return base64Image;
  } else {
    return "No Image Picked";
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


//Admin Table

Future<void> addAdmin({required String username, required Admin admin}) async {
  var adminBox = await Hive.openBox<Admin>('AdminBox');
  adminBox.put(username, admin);
}


