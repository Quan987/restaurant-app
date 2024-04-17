// import 'package:project2/pages/cart.dart';
// import 'package:flutter/material.dart';

// class MySilverAppbar extends StatelessWidget {
//   final Widget child;
//   final Widget title;
//   const MySilverAppbar({super.key, required this.child, required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return SliverAppBar(
//       expandedHeight: 340,
//       collapsedHeight: 120,
//       floating: false,
//       pinned: true,
//       actions: [
//         IconButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => CartPage(),
//               ),
//             );
//           },
//           icon: Icon(Icons.shopping_cart),
//         )
//       ],
//       backgroundColor: Theme.of(context).colorScheme.background,
//       foregroundColor: Theme.of(context).colorScheme.primary,
//       title: Text('Food Delivery Application'),
//       centerTitle: true,
//       flexibleSpace: FlexibleSpaceBar(
//         background: Padding(
//           padding: const EdgeInsets.only(bottom: 50.0),
//           child: Stack(
//             fit: StackFit.expand,
//             children: [
//               child,
//               Positioned(
//                 bottom: -20,
//                 left: 0,
//                 right: 0,
//                 child: Container(
//                   height: 40,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     color: Theme.of(context).colorScheme.background,
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.5),
//                         spreadRadius: 2,
//                         blurRadius: 5,
//                         offset: Offset(0, 3),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         title: title,
//         centerTitle: true,
//         titlePadding: EdgeInsets.only(left: 0, right: 0),
//         expandedTitleScale: 1,
//       ),
//     );
//   }
// }
