import 'package:coffee_app_new/components/model/admin_model.dart';
import 'package:coffee_app_new/components/model/category_model.dart';
import 'package:coffee_app_new/components/model/coffee_model.dart';
import 'package:coffee_app_new/components/model/coffee_shop.dart';
import 'package:coffee_app_new/screen/user/screen_splash.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

const adminLogStatus = 'Admin Logged';
const userLogStatus = 'User Logged';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(CoffeeModelAdapter().typeId)) {
    Hive.registerAdapter(CoffeeModelAdapter());
  }
  if (!Hive.isAdapterRegistered(CategoryModelAdapter().typeId)) {
    Hive.registerAdapter(CategoryModelAdapter());
  }
  if (!Hive.isAdapterRegistered(AdminAdapter().typeId)) {
    Hive.registerAdapter(AdminAdapter());
  }
  final adminBox = await Hive.openBox<Admin>('AdminBox');
  if (adminBox.isEmpty) {
    final defaultAdmin = Admin(username: 'Admin', password: 'Password@123');
    adminBox.add(defaultAdmin);
  }

  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CoffeeShopProvider(),
      builder: (context, child) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ScreenSplash(),
      ),
    );
  }
}
