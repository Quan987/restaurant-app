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

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project2/components/loading.dart';
import 'package:project2/components/silverappbar.dart';
import 'package:project2/models/food.dart';
import 'package:project2/models/restaurant.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  bool _isLoading = true;
  late TabController _tabController;
  final Restaurant _restaurant = Restaurant();

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
    _tabController = TabController(length: _restaurant.foodCount, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // List<Widget> displayAllFood(List<List<Food>> allFoodList) {
  //   return allFoodList.map(() {}).toList();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        title: Text("Home".toUpperCase()),
        centerTitle: true,
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
          : NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverAppBar(
                  title: Text("Restaurant Menu".toUpperCase()),
                  centerTitle: true,
                  pinned: true,
                  floating: true,
                  forceElevated: innerBoxIsScrolled,
                  bottom: TabBar(
                    controller: _tabController,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 14),
                    isScrollable: true,
                    tabAlignment: TabAlignment.center,
                    labelColor: Colors.blue[600],
                    indicatorColor: Colors.blue[600],
                    tabs: _restaurant.allFoodKey
                        .map((food) => Tab(child: Text(food.toUpperCase())))
                        .toList(),
                  ),
                ),
              ],
              body: Consumer<Restaurant>(
                builder: (context, value, child) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      ListView.builder(
                        itemCount: _restaurant.vietMenu.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final food = _restaurant.vietMenu[index];
                          return Column(
                            children: [
                              Text(food.name),
                              Text(food.description),
                              Text("${food.price}"),
                            ],
                          );
                        },
                      ),
                      Column(children: [Text("ss")]),
                      Column(children: [Text("Aa")]),
                      Column(children: [Text("bb")]),
                      Column(children: [Text("cc")]),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
