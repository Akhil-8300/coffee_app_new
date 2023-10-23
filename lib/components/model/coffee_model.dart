import 'package:hive/hive.dart';
part 'coffee_model.g.dart';

@HiveType(typeId: 1)
class CoffeeModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String price;
  @HiveField(2)
  final String category;
  @HiveField(3)
  final String imagePath;
  @HiveField(4)
  final int quantity;

  CoffeeModel({
    required this.name,
    required this.price,
    required this.category,
    required this.imagePath,
    required this.quantity,
  });
}
