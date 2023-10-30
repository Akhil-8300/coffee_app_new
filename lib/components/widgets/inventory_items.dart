import 'package:coffee_app_new/components/constants/colors.dart';
import 'package:coffee_app_new/components/model/coffee_model.dart';
import 'package:coffee_app_new/components/model/coffee_shop.dart';
import 'package:coffee_app_new/components/widgets/admin_coffee_tile.dart';
import 'package:coffee_app_new/db/db_helper.dart';
import 'package:coffee_app_new/screen/admin/screen_admin_edit_items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InventoryItems extends StatelessWidget {
  const InventoryItems({super.key});

  @override
  Widget build(BuildContext context) {
    void popWindow() {
      Navigator.pop(context);
    }

    return Consumer<CoffeeShopProvider>(
      builder: (context, provider, child) {
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
                        onDelete: () async {
                          showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog.adaptive(
                                    backgroundColor: mainTitles,
                                    content: Text(
                                      "Do you want to permenantly delete this item?",
                                      style: TextStyle(
                                          color: white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    actions: [
                                      ElevatedButton.icon(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: white),
                                        onPressed: () async {
                                          await deleteItemFromDb(
                                              productId: eachCoffee.id);
                                          provider.getCoffeeData();
                                          popWindow();
                                        },
                                        icon: const Icon(
                                          Icons.check_circle,
                                          color: Colors.green,
                                        ),
                                        label: const Text(
                                          'Yes',
                                          style: TextStyle(color: Colors.green),
                                        ),
                                      ),
                                      ElevatedButton.icon(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: white),
                                        onPressed: () {
                                          popWindow();
                                        },
                                        icon: const Icon(
                                          Icons.cancel,
                                          color: Colors.red,
                                        ),
                                        label: const Text(
                                          'No',
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      )
                                    ],
                                  ));
                        });
                  },
                ),
              )
            ],
          );
        }
      },
    );
  }
}
