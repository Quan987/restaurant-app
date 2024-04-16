// import 'package:project2/pages/login.dart';
// import 'package:project2/pages/register.dart';
// import 'package:flutter/material.dart';

// class LoginOrRegister extends StatefulWidget {
//   const LoginOrRegister({super.key});

//   @override
//   State<LoginOrRegister> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<LoginOrRegister> {

//   bool showLoginPage = true;

//   void togglePages(){
//     setState(() {
//       showLoginPage= !showLoginPage;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (showLoginPage){
//       return LoginPage(
//         onTap: togglePages,
//       );
//     } else {
//       return RegisterPage(
//         onTap: togglePages,
//       );
//     }
//   }
// }