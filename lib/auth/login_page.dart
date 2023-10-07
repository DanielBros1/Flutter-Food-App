import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'forgot_password_page.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;

  const LoginPage({super.key, required this.showRegisterPage});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    if (_emailController.text.trim().isEmpty) {
      debugPrint('Pusty mail');
    }
    if (_passwordController.text.trim().isEmpty) {
      debugPrint('Puste haslo');
      ///todo:: utworzyc w Build czerwony wykrzynik i informacje o niepoprawnym
      ///todo:: hasle i emailu. Domyslnie na false, ustawiac na True, gdy w tym ifie
    }
    debugPrint (_emailController.text.trim());
    debugPrint (_passwordController.text);
    //loading circle
    // showDialog(
    //   context: context,
    //   builder: (context) {
    //     return Center(child: const CircularProgressIndicator.adaptive());
    //   },
    // );
    try {
      debugPrint('Hello');
      // Attempt to sign in
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        //trim() creates a string without leading and trailing whitespaces
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );
      // pop the loading circle
      // Navigator.of(context).pop();
    } catch (e) {
      debugPrint("Hello from catch e");
      String errorMessage = "An error occurred during sign-in ";

      // Exception handling
      if (e is FirebaseAuthException) {
        debugPrint(e.code);
        debugPrint('Hello from catch FirebaseException');
        switch (e.code) {
          case 'invalid-email':
            errorMessage = "The email address is badly formatted.";
            break;
          case 'wrong-password':
            errorMessage = "Incorrect password.";
            break;
          case 'too-many-requests':
            errorMessage =
                "Too many unsuccessful sign-in attempts. Please try again later.";
            break;
          case 'configuration-not-found':
            errorMessage = "Incorrect address E-mail.";
            break;
        }
      }

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text(errorMessage),
            actions: <Widget>[
              TextButton(
                child: Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade200,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 15,
                ),
                Icon(
                  Icons.restaurant_menu_outlined,
                  color: Colors.grey.shade700,
                  size: 120,
                ),
                SizedBox(height: 65),
                Text(
                  'Hello Again!',
                  style: TextStyle(
                    fontSize: 42,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  """Welcome back, you've been missed""",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                // E-mail textField
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.brown.shade300,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.brown.shade800),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Email',
                      fillColor: Colors.brown.shade200,
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                // Password textField
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.brown.shade300,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.brown.shade800),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Password',
                      fillColor: Colors.brown.shade200,
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                // Forgot Password Text
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ForgotPasswordPage();
                          }));
                        },
                        child: Text(
                          'Forgot password? ',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                // SignIn Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: GestureDetector(
                    onTap: signIn,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.brown,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                //Register now text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member? ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.showRegisterPage,
                      child: Text(
                        'Register now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
