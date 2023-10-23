import 'package:coffee_app_new/components/model/category_model.dart';
import 'package:coffee_app_new/components/model/coffee_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

class CoffeeShopProvider extends ChangeNotifier {
  List<CoffeeModel> shop = [];

  Future<void> getCoffeeData() async {
    var coffeeBox = await Hive.openBox<CoffeeModel>('CoffeeBox');
    shop.addAll(coffeeBox.values);
    notifyListeners();
    debugPrint('called');
    Hive.close();
  }

  List<CategoryModel> categories = [];
  Future<void> getCategoryData() async {
    var categoryBox = await Hive.openBox<CategoryModel>('CategoryBox');
    categories.clear();
    categories.addAll(categoryBox.values);
    notifyListeners();
    // Hive.close();
  }

  final List<CoffeeModel> _userCart = [];

  List<CoffeeModel> get userCart => _userCart;

  void addItemToCart(CoffeeModel coffee, int quantity) {
    _userCart.add(coffee);
    notifyListeners();
  }

  void removeItemFromCart(CoffeeModel coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }
}
