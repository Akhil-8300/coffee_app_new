// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:coffee_app_new/components/constants/colors.dart';
// import 'package:coffee_app_new/components/model/coffee_model.dart';
// import 'package:coffee_app_new/components/model/coffee_shop.dart';
// import 'package:coffee_app_new/components/widgets/my_button.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class CoffeeOrderPage extends StatefulWidget {
//   final CoffeeModel coffee;
//   const CoffeeOrderPage({super.key, required this.coffee});

//   @override
//   State<CoffeeOrderPage> createState() => _CoffeeOrderPageState();
// }

// class _CoffeeOrderPageState extends State<CoffeeOrderPage> {

//   int quantity = 1;

//   void increment() {
//     setState(() {

//       if (quantity < 10) {
//         quantity++;
//       }
//     });
//   }

//   void decrement() {
//     if (quantity > 0) {
//       setState(() {
//         quantity--;
//       });
//     }
//   }

//   void addToCart() {

//     if (quantity > 0) {
//       Provider.of<CoffeeShopProvider>(context, listen: false)
//           .addItemToCart(widget.coffee, quantity);

//       Navigator.pop(context);

//       showDialog(
//         context: context,
//         builder: (context) => const AlertDialog(
//           backgroundColor: Colors.brown,
//           title: Text(
//             "Successfully added to cart",
//             style: TextStyle(color: Colors.white),
//           ),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: mainbg,
//       appBar: AppBar(
//         backgroundColor: Colors.grey[200],
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(
//             Icons.arrow_back_ios,
//             color: Colors.grey[900],
//           ),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           color: Colors.grey[200],
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // coffee image
//               Image.asset(
//                 widget.coffee.imagePath!,
//                 height: 120,
//               ),

//               const SizedBox(height: 50),

//               // quantity
//               Column(
//                 children: [
//                   // heading
//                   const Text(
//                     "Q U A N T I T Y",
//                     style: TextStyle(color: Colors.grey, fontSize: 20),
//                   ),
//                   const SizedBox(height: 15),
//                   // counter
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       // decrement
//                       IconButton(
//                         onPressed: decrement,
//                         icon: const Icon(Icons.remove),
//                         color: Colors.grey,
//                       ),

//                       // count
//                       Container(
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         width: 60,
//                         padding: const EdgeInsets.all(10),
//                         child: Center(
//                           child: Text(
//                             quantity.toString(),
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: Colors.brown[800],
//                               fontSize: 32,
//                             ),
//                           ),
//                         ),
//                       ),

//                       // icrement
//                       IconButton(
//                         onPressed: increment,
//                         icon: const Icon(Icons.add),
//                         color: Colors.grey,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),

//               const SizedBox(height: 50),

//               // size
//               // const Text(
//               //   "S I Z E",
//               //   style: TextStyle(color: Colors.grey, fontSize: 20),
//               // ),
//               // const SizedBox(height: 15),
//               // Row(
//               //   mainAxisAlignment: MainAxisAlignment.center,
//               //   children: [
//               //     // small
//               //     GestureDetector(
//               //       onTap: () => selectSize('S'),
//               //       child: MyChip(text: 'S', isSelected: _sizeSelection[0]),
//               //     ),

//               //     const SizedBox(width: 4),

//               //     // medium
//               //     GestureDetector(
//               //       onTap: () => selectSize('M'),
//               //       child: MyChip(text: 'M', isSelected: _sizeSelection[1]),
//               //     ),

//               //     const SizedBox(width: 4),

//               //     // large
//               //     GestureDetector(
//               //       onTap: () => selectSize('L'),
//               //       child: MyChip(text: 'L', isSelected: _sizeSelection[2]),
//               //     ),
//               //   ],
//               // ),

//               const SizedBox(height: 75),

//               // add to cart button
//               MyButton(onPressed: addToCart, data: "Add to cart"),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

import 'package:coffee_app_new/components/model/coffee_model.dart';

class CoffeeOrderPage extends StatelessWidget {
 final CoffeeModel coffee;
  const CoffeeOrderPage({
    Key? key,
    required this.coffee,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(coffee.name),
      ),
    );
  }
}
