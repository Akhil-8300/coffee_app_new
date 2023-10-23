// import 'package:coffee_app_new/components/model/category_model.dart';
// import 'package:coffee_app_new/components/model/coffee_shop.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class CategoryDropDown extends StatefulWidget {
//   const CategoryDropDown({super.key});

//   @override
//   State<CategoryDropDown> createState() => _CategoryDropDownState();
// }

// class _CategoryDropDownState extends State<CategoryDropDown> {
//   var value = null;

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<CoffeeShopProvider>(builder: (context, provider, child) {
//       if (provider.categories.isEmpty) {
//         provider.getCategoryData();
//         return const Center(
//           child: CircularProgressIndicator(),
//         );
//       } else {
//         return DropdownButton<CategoryModel>(
//           value: value,
//           onChanged: (CategoryModel? selectedCategory) {
//             value = selectedCategory;
//           },
//           items: provider.categories
//               .map<DropdownMenuItem<CategoryModel>>((CategoryModel category) {
//             return DropdownMenuItem<CategoryModel>(
//               value: category,
//               child: Text(category.name),
//             );
//           }).toList(),
//         );
//       }
//     });
//   }
// }

import 'package:coffee_app_new/components/model/category_model.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  final List<CategoryModel> categories;
  final CategoryModel? selectedCategory;
  final ValueChanged<CategoryModel?> onChanged;
  const CustomDropDown(
      {super.key,
      required this.categories,
      this.selectedCategory,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<CategoryModel>(
      value: selectedCategory,
      onChanged: onChanged,
      items: categories.map((CategoryModel category) {
        return DropdownMenuItem<CategoryModel>(
          value: category,
          child: Text(category.name),
        );
      }).toList(),
    );
  }
}
