import 'package:coffee_app_new/components/widgets/coffee_tile.dart';
import 'package:coffee_app_new/components/model/coffee_model.dart';
import 'package:coffee_app_new/components/model/coffee_shop.dart';
import 'package:coffee_app_new/screen/user/coffee_order_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenShop extends StatefulWidget {
  const ScreenShop({super.key});

  @override
  State<ScreenShop> createState() => _ScreenShopState();
}

class _ScreenShopState extends State<ScreenShop> {
  void goToCoffeePage(CoffeeModel coffee) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CoffeeOrderPage(
          coffee: coffee,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShopProvider>(builder: (context, provider, child) {
      if (provider.shop.isEmpty) {
        provider.getCoffeeData();
        debugPrint('Completed');
        return const Center(child: CircularProgressIndicator());
      } else {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 25.0, top: 25),
              child: Text(
                'Choose your coffee',
                style: TextStyle(
                  //fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 25),
            Expanded(
              child: ListView.builder(
                itemCount: provider.shop.length,
                itemBuilder: (context, index) {
                  CoffeeModel eachCoffee = provider.shop[index];
                  debugPrint(provider.shop.length.toString());
                  return CoffeeTile(
                    coffee: eachCoffee,
                    onPressed: () => goToCoffeePage(eachCoffee),
                  );
                },
              ),
            )
          ],
        );
      }
    });
  }
}
