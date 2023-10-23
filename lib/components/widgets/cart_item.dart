import 'package:coffee_app_new/components/widgets/colors.dart';
import 'package:coffee_app_new/components/model/coffee_model.dart';
import 'package:coffee_app_new/components/widgets/my_dropdown.dart';
import 'package:flutter/material.dart';

class CartItem extends StatefulWidget {
  final CoffeeModel coffee;
  final void Function()? onPressed;
  const CartItem({
    super.key,
    required this.coffee,
    required this.onPressed,
  });

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int quantity = 1;

  // increment quantity
  void increment() {
    setState(() {
      // max out at 10
      if (quantity < 10) {
        quantity++;
      }
    });
  }

  // decrement quantity
  void decrement() {
    if (quantity > 0) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: coffeeTileBg,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(left: 25, right: 25, bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      child: Column(
        children: [
          ListTile(
            leading: Image.asset(widget.coffee.imagePath),
            title: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                widget.coffee.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            subtitle: Text('\u{20B9}${widget.coffee.price}'),
            trailing: IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.brown[300],
              ),
              onPressed: widget.onPressed,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Qty'),
                SizedBox(width: 30),
                MyDropDownMenu(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
