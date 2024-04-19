// import 'package:project2/components/receipt.dart';
// import 'package:project2/models/restaurant.dart';
// import 'package:project2/services/database/databaseService.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class DeliveryProgressPage extends StatefulWidget {
//   const DeliveryProgressPage({super.key});

//   @override
//   State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
// }

// class _DeliveryProgressPageState extends State<DeliveryProgressPage> {
//   FirestoreService db = FirestoreService();

//   @override
//   void initState() {
//     super.initState();

//     String receipt = context.read<Restaurant>().displayCartReceipt();
//     db.saveOrderToDatabase(receipt);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.background,
//       appBar: AppBar(
//         title: Text(
//           'Delivery in Progress',
//           style: TextStyle(
//             color: Theme.of(context).colorScheme.primary,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         backgroundColor: Colors.transparent,
//         foregroundColor: Theme.of(context).colorScheme.primary,
//         centerTitle: true,
//       ),
//       bottomNavigationBar: _buildBottomNavBar(context),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             MyReceipt(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildBottomNavBar(BuildContext context) {
//     return Container(
//       height: 100,
//       decoration: BoxDecoration(
//         color: Theme.of(context).colorScheme.secondary,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(40),
//           topRight: Radius.circular(40),
//         ),
//       ),
//       padding: EdgeInsets.all(25),
//       child: Row(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               color: Theme.of(context).colorScheme.background,
//               shape: BoxShape.circle,
//             ),
//             child: IconButton(
//               onPressed: () {},
//               icon: Icon(
//                 Icons.person,
//                 color: Theme.of(context).colorScheme.primary,
//               ),
//             ),
//           ),
//           SizedBox(
//             width: 10,
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Jone Doe",
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18,
//                   color: Theme.of(context).colorScheme.primary,
//                 ),
//               ),
//               Text(
//                 "Driver",
//                 style: TextStyle(
//                   color: Theme.of(context).colorScheme.tertiary,
//                 ),
//               ),
//             ],
//           ),
//           Spacer(),
//           Row(
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   color: Theme.of(context).colorScheme.background,
//                   shape: BoxShape.circle,
//                 ),
//                 child: IconButton(
//                   onPressed: () {},
//                   icon: Icon(
//                     Icons.message,
//                     color: Theme.of(context).colorScheme.primary,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width: 10,
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                   color: Theme.of(context).colorScheme.background,
//                   shape: BoxShape.circle,
//                 ),
//                 child: IconButton(
//                   onPressed: () {},
//                   icon: Icon(
//                     Icons.call,
//                     color: Theme.of(context).colorScheme.primary,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
