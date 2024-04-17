import 'package:project2/components/button.dart';
import 'package:project2/components/textfield.dart';
import 'package:project2/components/textformfield.dart';
import 'package:project2/pages/register.dart';
import 'package:project2/services/auth/authService.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

//   final Function()? onTap;

//   LoginPage({Key? key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

//   void login() async {
//     final authService = AuthService();
//     try {
//       await authService.signInWithEmailPassword(
//         _emailController.text,
//         _passwordController.text,
//       );
//     }
//     catch (e) {
//       showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//                 title: Text(e.toString()),
//               ));
//     }
//   }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.background,
//       body: Center(
//         child: SingleChildScrollView(
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Image(
//                   image: AssetImage('lib/images/LogoColored.png'),
//                   width: 250,
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Text(
//                   "Food Delivery Application",
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: Theme.of(context).colorScheme.inversePrimary,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   'Welcome Back!',
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Colors.grey[600],
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 25,
//                 ),
//                 MyTextField(
//                     controller: _emailController,
//                     hintText: 'Email',
//                     obscureText: false),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 MyTextField(
//                     controller: _passwordController,
//                     hintText: 'Password',
//                     obscureText: true),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 MyButton(
//                   text: 'Log In',
//                   onTap: () => login(),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       'New member?',
//                       style: TextStyle(
//                           color: Theme.of(context).colorScheme.inversePrimary),
//                     ),
//                     const SizedBox(
//                       width: 4,
//                     ),
//                     GestureDetector(
//                       onTap: widget.onTap,
//                       child: Text(
//                         'Register',
//                         style: TextStyle(
//                           color: Theme.of(context).colorScheme.inversePrimary,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          "Food Delivery App".toUpperCase(),
          style: TextStyle(
            fontSize: 24,
            color: Theme.of(context).colorScheme.inversePrimary,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Login".toUpperCase(),
              style: const TextStyle(fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                'lib/images/LogoColored.png',
              ),
            ),
            const Text(
              'Welcome Back Customer!',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: Form(
                key: _loginFormKey,
                child: Column(
                  children: [
                    MyTextFormField(
                      controller: _emailController,
                      isObscure: false,
                      label: "Email",
                    ),
                    const SizedBox(height: 16),
                    MyTextFormField(
                      controller: _passwordController,
                      isObscure: true,
                      label: "Password",
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "New User? ",
                          style: TextStyle(fontSize: 14),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => const RegisterPage(),
                            ));
                          },
                          child: Text(
                            "Register Here!",
                            style: TextStyle(
                                color: Colors.blue[700], fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
