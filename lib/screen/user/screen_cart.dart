import 'package:coffee_app_new/components/widgets/cart_item.dart';
import 'package:coffee_app_new/components/model/coffee_model.dart';
import 'package:coffee_app_new/components/model/coffee_shop.dart';
import 'package:coffee_app_new/components/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenCart extends StatefulWidget {
  const ScreenCart({super.key});

  @override
  State<ScreenCart> createState() => _ScreenCartState();
}

class _ScreenCartState extends State<ScreenCart> {
  void removeItemFromCart(CoffeeModel coffee) {
    Provider.of<CoffeeShopProvider>(context, listen: false).removeItemFromCart(coffee);
  }

  void payNow() {}

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShopProvider>(
      builder: (context, value, child) => Column(
        children: [
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 25.0, top: 25, bottom: 25),
                child: Text(
                  'Your Cart',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: value.userCart.length,
              itemBuilder: (context, index) {
                CoffeeModel coffee = value.userCart[index];

                return CartItem(
                  coffee: coffee,
                  onPressed: () => removeItemFromCart(coffee),
                );
              },
            ),
          ),
          MyButton(onPressed: payNow, data: 'Pay Now'),
        ],
      ),
    );
  }
}
