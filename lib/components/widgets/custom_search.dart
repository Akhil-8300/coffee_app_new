import 'package:coffee_app_new/components/constants/colors.dart';
import 'package:coffee_app_new/components/model/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = '',
        icon: Icon(
          Icons.clear,
          color: mainTitles,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(
        Icons.arrow_back_rounded,
        color: mainTitles,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(query),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final itemProvider = Provider.of<CoffeeShopProvider>(context);
    
    return ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: itemProvider.shop.length,
        itemBuilder: (context, index) {
          var result = itemProvider.shop[index];
          return ListTile(
            title: Text(
              result.name,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey),
            ),
            onTap: () async {
              query = result.name;
              itemProvider.getCoffeeData();

              ///todo coffee order
            },
          );
        });
  }
}
