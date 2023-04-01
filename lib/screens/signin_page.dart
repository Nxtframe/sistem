import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sistem/screens/homepage.dart';
import 'package:sistem/screens/signup_page.dart';
import 'package:sistem/theme/app_theme.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

final _formKey = GlobalKey<FormState>();

class _SignInPageState extends State<SignInPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool isSignedIn = false;
  Future<void> _signInUser(
      {required String password, required String email}) async {
    try {
      final result = await Amplify.Auth.signIn(
        username: email,
        password: password,
      );

      setState(() {
        isSignedIn = result.isSignedIn;
      });
    } on AuthException catch (e) {
      safePrint(e.message);
    }
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: _formKey,
            child: Column(
              children: [
                TextField(
                  style: TextStyle(color: Colors.black), // Email Field
                  controller: _emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
                TextField(
                  style: TextStyle(color: Colors.black), // Email Field
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
                ElevatedButton(
                    onPressed: () => {
                          _signInUser(
                                  email: _emailController.text,
                                  password: _passwordController.text)
                              .then((value) => {
                                    if (isSignedIn)
                                      {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    ((BuildContext context) =>
                                                        const HomePage())))
                                      }
                                  })
                        },
                    child: const Text("Sign in")),
                    ElevatedButton(
                    onPressed: () => {
                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    ((BuildContext context) =>
                                                        const SignupPage())))
                                      },
                    child: const Text("Sign Up"))
              ],
            )));
  }
}
