// import 'package:project2/components/currentLocation.dart';
// import 'package:project2/components/descriptionbox.dart';
// import 'package:project2/components/drawer.dart';
// import 'package:project2/components/foodtile.dart';
// import 'package:project2/components/silverappbar.dart';
// import 'package:project2/components/tabbar.dart';
// import 'package:project2/models/food.dart';
// import 'package:project2/models/restaurant.dart';
// import 'package:project2/pages/food.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

//   late TabController tabController;

//   @override
//   void initState() {
//     super.initState();
//     tabController = TabController(length: FoodCategory.values.length, vsync: this);
//   }

//   @override
//   void dispose() {
//     tabController.dispose();
//     super.dispose();
//   }

//   List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
//     return fullMenu.where((food) => food.category == category).toList();
//   }

//   List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
//     return FoodCategory.values.map((category) {
//       List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);

//       return ListView.builder(
//         itemCount: categoryMenu.length,
//         physics: NeverScrollableScrollPhysics(),
//         padding: EdgeInsets.zero,
//         itemBuilder: (context, index) {
//           final food = categoryMenu[index];
//           return MyFoodTile(
//             food: food,
//             onTap: (){
//               Navigator.push(context, MaterialPageRoute(builder: (context) => FoodPage(food: food)));
//             }
//           );
//         }
//       );
//     }).toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: MyDrawer(),
//       body: NestedScrollView(
//         headerSliverBuilder: (context, innerBoxIsScrolled) =>
//         [
//           MySilverAppbar(
//             title: MyTabBar(tabController: tabController),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Divider(
//                   indent: 25,
//                   endIndent: 25,
//                   color: Theme.of(context).colorScheme.tertiary,
//                 ),

//                 MyCurrentLocation(),

//                 MyDescrptionBox(),
//               ],
//             ),
//           ),
//         ],
//         body: Consumer<Restaurant>(
//           builder: (context, restaurant, child) => TabBarView(
//           controller: tabController,
//           children: getFoodInThisCategory(restaurant.menu),
//         ),
//         )
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project2/components/loading.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = true;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home".toUpperCase()),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
      body: _isLoading
          ? const LoadingWidget()
          : const Column(
              children: [
                Text("Text"),
              ],
            ),
    );
  }
}
