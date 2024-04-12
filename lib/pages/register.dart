import 'package:project2/components/button.dart';
import 'package:project2/components/textfield.dart';
import 'package:project2/services/auth/authService.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;

  RegisterPage({Key? key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _confirmpasswordController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void register() async {
    final _auth = AuthService();

    if (_passwordController.text == _confirmpasswordController.text) {
      try {
        _auth.signUpWithEmailAndPassword(
        _emailController.text,
        _passwordController.text);
      } catch (e) {
        showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ));
      }
    }

    else {
      showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Passwords don't match!"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('lib/images/LogoColored.png'),
                  width: 250,
                ),
                SizedBox(height: 20,),
                Text(
                  'Food Delivery Application',
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Welcome to New Membership!',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
        
                SizedBox(height: 25,),
                MyTextField(controller: _emailController, hintText: 'Email', obscureText: false),
        
                SizedBox(height: 20,),
                MyTextField(controller: _passwordController, hintText: 'Password', obscureText: true),
        
                SizedBox(height: 20,),
                MyTextField(controller: _confirmpasswordController, hintText: 'Confirm Password', obscureText: true),
        
                SizedBox(height: 20,),
                MyButton(text: 'Register', onTap: () => register(),),
            
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already had an account?',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary
                      ),
                    ),
                    SizedBox(width: 4,),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        'Log In',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
