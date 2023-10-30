import 'package:hive_flutter/hive_flutter.dart';
part 'admin_model.g.dart';
@HiveType(typeId: 3)
class Admin {
  @HiveField(0)
  final String username;
  @HiveField(1)
  final String password;

  Admin({
    required this.username,
    required this.password,
  });
}
