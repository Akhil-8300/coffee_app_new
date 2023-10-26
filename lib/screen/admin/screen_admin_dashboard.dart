import 'package:coffee_app_new/components/widgets/admin_grid_tile.dart';
import 'package:coffee_app_new/components/constants/colors.dart';
import 'package:coffee_app_new/components/constants/font_style.dart';
import 'package:coffee_app_new/screen/admin/screen_admin_add_category.dart';
import 'package:coffee_app_new/screen/admin/screen_admin_add_coffee.dart';
import 'package:coffee_app_new/screen/admin/screen_admin_inventory.dart';
import 'package:coffee_app_new/screen/admin/screen_admin_revenue.dart';
import 'package:coffee_app_new/screen/admin/screen_admin_settings.dart';
import 'package:coffee_app_new/screen/user/screen_intro.dart';
import 'package:flutter/material.dart';

class ScreenAdminDashBoard extends StatelessWidget {
  const ScreenAdminDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    void gotoItemsPage() {
      Navigator.push(
          context, MaterialPageRoute(builder: (ctx) => const AddCoffeeToDB()));
    }

    void gotoCategoryPage() {
      Navigator.push(context,
          MaterialPageRoute(builder: (ctx) => const AddCategoryToDB()));
    }

    void gotoRevenuePage() {
      Navigator.push(context,
          MaterialPageRoute(builder: (ctx) => const AdminRevenueScreen()));
    }

    void gotoAdminSettings(){
      Navigator.push(context,MaterialPageRoute(builder:(ctx)=>const ScreenAdminSettings()));
    }

    List<dynamic> gridItems = [
      AdminGridTile(
        iconData: Icons.inventory,
        data: 'Inventory',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => const AdminScreenInventory(),
            ),
          );
        },
      ),
      AdminGridTile(
        iconData: Icons.add_card,
        data: 'Add Items',
        onTap: () {
          showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    title: Center(child: MySubheadings(data: 'Choose option')),
                    contentPadding: const EdgeInsets.all(10),
                    backgroundColor: mainbg,
                    actions: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              gotoItemsPage();
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: mainTitles,
                              margin: const EdgeInsets.all(10),
                              child: const Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  'Add Drinks',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              gotoCategoryPage();
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: mainTitles,
                              margin: const EdgeInsets.all(10),
                              child: const Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  'Add Categories',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ));
        },
      ),
      AdminGridTile(
        iconData: Icons.monetization_on,
        data: 'Revenue',
        onTap: () {
          gotoRevenuePage();
        },
      ),
      AdminGridTile(
        iconData: Icons.settings,
        data: 'Settings',
        onTap: () {gotoAdminSettings();},
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainTitles,
        leading: CircleAvatar(
          backgroundImage: const AssetImage('assets/images/espresso.png'),
          backgroundColor: Colors.brown[700],
          radius: 6,
        ),
        title: const Text(
          'Admin Panel',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (ctx) => const ScreenIntro())),
              icon: const Icon(Icons.logout))
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1 / 1.5,
                crossAxisCount: 2),
            itemCount: gridItems.length,
            itemBuilder: ((context, index) {
              return gridItems[index];
            }),
          ),
        ),
      ),
    );
  }
}
