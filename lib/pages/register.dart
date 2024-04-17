import 'package:project2/components/textformfield.dart';
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
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                'lib/images/LogoColored.png',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: Form(
                key: _registerFormKey,
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: MyTextFormField(
                            controller: _firstNameControler,
                            isObscure: false,
                            label: "First Name",
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: MyTextFormField(
                            controller: _lastNameControler,
                            isObscure: false,
                            label: "Last Name",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
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
                    MyTextFormField(
                      controller: _confirmpasswordController,
                      isObscure: true,
                      label: "Confirm Password",
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
