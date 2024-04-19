// import 'package:project2/models/restaurant.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class MyCurrentLocation extends StatelessWidget {
//   const MyCurrentLocation({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     TextEditingController textController = TextEditingController();

//     void openLocationSearchBox(BuildContext context) {
//       showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           title: Text(
//             'Your Location',
//             style: TextStyle(
//               color: Colors.indigo,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           content: TextField(
//             controller: textController,
//             decoration: InputDecoration(
//               hintText: "Address",
//               hintStyle: TextStyle(color: Colors.grey),
//               filled: true,
//               fillColor: Colors.grey.shade200,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//                 borderSide: BorderSide.none,
//               ),
//             ),
//           ),
//           actions: [
//             MaterialButton(
//               onPressed: () {
//                 Navigator.pop(context);
//                 textController.clear();
//               },
//               child: Text(
//                 'Cancel',
//                 style: TextStyle(color: Colors.red),
//               ),
//             ),
//             MaterialButton(
//               onPressed: () {
//                 String newAddress = textController.text;
//                 Provider.of<Restaurant>(context, listen: false)
//                     .updateDeliveryAddress(newAddress);
//                 Navigator.pop(context);
//                 textController.clear();
//               },
//               child: Text(
//                 'Save',
//                 style: TextStyle(color: Colors.green),
//               ),
//             ),
//           ],
//         ),
//       );
//     }

//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Delivery to',
//             style: TextStyle(
//               color: Theme.of(context).colorScheme.primary,
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(height: 10),
//           GestureDetector(
//             onTap: () => openLocationSearchBox(context),
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(10),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.5),
//                     spreadRadius: 1,
//                     blurRadius: 3,
//                     offset: Offset(0, 2),
//                   ),
//                 ],
//               ),
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Consumer<Restaurant>(
//                     builder: (context, restaurant, child) => Text(
//                       restaurant.deliveryAddress,
//                       style: TextStyle(
//                         color: Theme.of(context).colorScheme.primary,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 10),
//                   Icon(
//                     Icons.keyboard_arrow_down_rounded,
//                     color: Colors.grey,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
