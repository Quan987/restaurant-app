import 'package:project2/components/button.dart';
import 'package:project2/components/textfield.dart';
import 'package:project2/services/auth/authService.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  // final Function()? onTap;

  // RegisterPage({Key? key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _registerFormKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameControler = TextEditingController();
  final TextEditingController _lastNameControler = TextEditingController();

  // void register() async {
  //   final _auth = AuthService();

  //   if (_passwordController.text == _confirmpasswordController.text) {
  //     try {
  //       _auth.signUpWithEmailAndPassword(
  //       _emailController.text,
  //       _passwordController.text);
  //     } catch (e) {
  //       showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //         title: Text(e.toString()),
  //       ));
  //     }
  //   }

  //   else {
  //     showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: Text("Passwords don't match!"),
  //     ));
  //   }
  // }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    _firstNameControler.dispose();
    _lastNameControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   backgroundColor: Theme.of(context).colorScheme.background,
    //   body: Center(
    //     child: SingleChildScrollView(
    //       child: Center(
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Image(
    //               image: AssetImage('lib/images/LogoColored.png'),
    //               width: 250,
    //             ),
    //             SizedBox(
    //               height: 20,
    //             ),
    //             Text(
    //               'Food Delivery Application',
    //               style: TextStyle(
    //                 fontSize: 20,
    //                 color: Theme.of(context).colorScheme.inversePrimary,
    //                 fontWeight: FontWeight.bold,
    //               ),
    //             ),
    //             Text(
    //               'Welcome to New Membership!',
    //               style: TextStyle(
    //                 fontSize: 14,
    //                 color: Colors.grey[600],
    //               ),
    //             ),
    //             SizedBox(
    //               height: 25,
    //             ),
    //             MyTextField(
    //                 controller: _emailController,
    //                 hintText: 'Email',
    //                 obscureText: false),
    //             SizedBox(
    //               height: 20,
    //             ),
    //             MyTextField(
    //                 controller: _passwordController,
    //                 hintText: 'Password',
    //                 obscureText: true),
    //             SizedBox(
    //               height: 20,
    //             ),
    //             MyTextField(
    //                 controller: _confirmpasswordController,
    //                 hintText: 'Confirm Password',
    //                 obscureText: true),
    //             SizedBox(
    //               height: 20,
    //             ),
    //             MyButton(
    //               text: 'Register',
    //               onTap: () => register(),
    //             ),
    //             SizedBox(
    //               height: 20,
    //             ),
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: [
    //                 Text(
    //                   'Already had an account?',
    //                   style: TextStyle(
    //                       color: Theme.of(context).colorScheme.inversePrimary),
    //                 ),
    //                 SizedBox(
    //                   width: 4,
    //                 ),
    //                 GestureDetector(
    //                   onTap: widget.onTap,
    //                   child: Text(
    //                     'Log In',
    //                     style: TextStyle(
    //                       color: Theme.of(context).colorScheme.inversePrimary,
    //                       fontWeight: FontWeight.bold,
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             )
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text("Registration".toUpperCase()),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset(
                'lib/images/LogoColored.png',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _registerFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      obscureText: false,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Email",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Password",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
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
