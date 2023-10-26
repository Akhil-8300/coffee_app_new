import 'package:coffee_app_new/components/model/coffee_model.dart';
import 'package:coffee_app_new/components/model/coffee_shop.dart';
import 'package:coffee_app_new/components/widgets/admin_coffee_tile.dart';
import 'package:coffee_app_new/screen/admin/screen_admin_edit_items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InventoryItems extends StatelessWidget {
  const InventoryItems({super.key});

  @override
  Widget build(BuildContext context) {
    // void goToCoffeePage(CoffeeModel coffee) {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => CoffeeOrderPage(
    //         coffee: coffee,
    //       ),
    //     ),
    //   );
    // }

    return Consumer<CoffeeShopProvider>(builder: (context, provider, child) {
      if (provider.shop.isEmpty) {
        provider.getCoffeeData();
        debugPrint('Completed');
        return const Center(child: CircularProgressIndicator());
      } else {
        var count = provider.shop.length;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25.0, top: 25, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Inventory',
                    style: TextStyle(
                      //fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'Total Items: $count',
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Expanded(
              child: ListView.builder(
                itemCount: provider.shop.length,
                itemBuilder: (context, index) {
                  CoffeeModel eachCoffee = provider.shop[index];
                  debugPrint(provider.shop.length.toString());
                  return AdminCoffeeTile(
                    coffee: eachCoffee,
                    onEdit: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => ScreenAdminEditItems(
                                    coffee: eachCoffee,
                                  )));
                      debugPrint('Detailed page with editing option');
                    },
                    onDelete: () {
                      debugPrint('Delete from db');
                    },
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
