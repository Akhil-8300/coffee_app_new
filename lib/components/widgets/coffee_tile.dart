import 'package:coffee_app_new/components/widgets/colors.dart';
import 'package:coffee_app_new/components/model/coffee_model.dart';
import 'package:coffee_app_new/db/db_helper.dart';
import 'package:flutter/material.dart';

class CoffeeTile extends StatelessWidget {
  final CoffeeModel coffee;
  final void Function()? onPressed;

  const CoffeeTile({
    super.key,
    required this.coffee,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: coffeeTileBg,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(left: 25, right: 25, bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      child: ListTile(
        leading: Image(
          image: imageProcessor(coffee.imagePath),
          width: 60,
          height: 60,
        ),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            coffee.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        subtitle: Text('\u{20B9}${coffee.price}'),
        trailing: IconButton(
          icon: Icon(
            Icons.arrow_forward,
            color: Colors.brown[300],
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
