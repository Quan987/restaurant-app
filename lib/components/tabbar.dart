// import 'package:project2/models/food.dart';
// import 'package:flutter/material.dart';

// class MyTabBar extends StatelessWidget {
//   final TabController tabController;

//   const MyTabBar({Key? key, required this.tabController}) : super(key: key);

//   List<Tab> _buildCategoryTabs(BuildContext context) {
//     return FoodCategory.values.map((category) {
//       return Tab(
//         child: Container(
//           decoration: BoxDecoration(
//             shape: BoxShape.rectangle,
//             borderRadius: BorderRadius.circular(10),
//             color: Color.fromARGB(255, 136, 183, 170),
//           ),
//           padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//           child: Text(
//             category.toString().split('.').last,
//             style: TextStyle(
//               fontSize: 16.0,
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//               letterSpacing: 1.0,
//             ),
//           ),
//         ),
//       );
//     }).toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: TabBar(
//         controller: tabController,
//         unselectedLabelColor: Theme.of(context).colorScheme.tertiary,
//         tabs: _buildCategoryTabs(context),
//       ),
//     );
//   }
// }
