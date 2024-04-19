// import 'package:project2/components/button.dart';
// import 'package:project2/pages/deliveryprogress.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_credit_card/flutter_credit_card.dart';

// class PaymentPage extends StatefulWidget {
//   const PaymentPage({super.key});

//   @override
//   State<PaymentPage> createState() => _PaymentPageState();
// }

// class _PaymentPageState extends State<PaymentPage> {
//   String cardNumber = '';
//   String expiryDate = '';
//   String cardHolderName = '';
//   String cvvCode = '';
//   bool isCvvFocused = false;
//   GlobalKey<FormState> formKey = GlobalKey<FormState>();

//   void userTappedPay() {
//     if (formKey.currentState!.validate()) {
//       showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           title: Text("Confirm Payment"),
//           content: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text("Card Number: $cardNumber"),
//                 Text("Expiry Date: $expiryDate"),
//                 Text("Card Holder's Name: $cardHolderName"),
//                 Text("CVV: $cvvCode"),
//               ],
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: Text("Cancel"),
//             ),

//             TextButton(
//               onPressed: () {
//               Navigator.pop(context);
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => DeliveryProgressPage()),
//               );},
//               child: Text("Yes"),
//             ),
//           ],
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.background,
//       appBar: AppBar(
//         title: Text('Checkout', style: TextStyle(
//           color: Theme.of(context).colorScheme.primary,
//           fontWeight: FontWeight.bold,
//         ),),
//         backgroundColor: Colors.transparent,
//         foregroundColor: Theme.of(context).colorScheme.primary,
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             children: [
//               CreditCardWidget(
//                 cardNumber: cardNumber,
//                 expiryDate: expiryDate,
//                 cardHolderName: cardHolderName,
//                 cvvCode: cvvCode,
//                 showBackView: isCvvFocused,
//                 onCreditCardWidgetChange: (p0) {},
//               ),

//               SizedBox(height: 20),
//               CreditCardForm(
//                 cardNumber: cardNumber,
//                 expiryDate: expiryDate,
//                 cardHolderName: cardHolderName,
//                 cvvCode: cvvCode,
//                 onCreditCardModelChange: (data) {
//                   setState(() {
//                     cardNumber = data.cardNumber;
//                     expiryDate = data.expiryDate;
//                     cardHolderName = data.cardHolderName;
//                     cvvCode = data.cvvCode;
//                   });
//                 },
//                 formKey: formKey,
//               ),

//               SizedBox(height: 20),

//               MyButton(
//                 text: "Pay",
//                 onTap: userTappedPay,
//               ),

//               SizedBox(height: 25),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
