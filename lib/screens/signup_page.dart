import 'dart:async';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:sistem/screens/confirmation_code.dart';
import 'package:sistem/theme/app_theme.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userController = TextEditingController();
  late bool isSignUpComplete = false;
  late bool _isLoading;
  late String? _errorMessage = '';

  final appTheme = AppTheme();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _userController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _signUpUser({
    required String username,
    required String password,
    required String email,
  }) async {
    if (_formKey.currentState!.validate()) {
      Map<CognitoUserAttributeKey, String> userAttributes = {
        // Send additional attributes here
        CognitoUserAttributeKey.preferredUsername: username,
      };
      try {
        SignUpResult res = await Amplify.Auth.signUp(
          username: email, // username = email because Email Sign up
          password: password,
          options: CognitoSignUpOptions(userAttributes: userAttributes),
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ConfirmationCode(
              email: _emailController.text,
              password: _passwordController.text,
            ),
          ),
        );
      } on AmplifyException {
        setState(() {
          _errorMessage = 'User already exists';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Padding(padding: EdgeInsets.only(top: 50)),
                const Image(
                  height: 350,
                  width: 400,
                  image: AssetImage("assets/images/register_image.png"),
                ),
                const Padding(padding: EdgeInsets.only(top: 50)),
                TextFormField(
                  style: const TextStyle(color: Colors.white), // Email Field
                  controller: _emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
                TextFormField(
                  style: const TextStyle(color: Colors.white), // Username Field
                  controller: _userController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                  ),
                ),
                TextFormField(
                  obscureText: true,
                  style: const TextStyle(color: Colors.white), // Password Field
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
                ElevatedButton(
                  child: const Text('Signup'),
                  onPressed: () {
                    final username = _userController.text;
                    final password = _passwordController.text;
                    final email = _emailController.text;
                    if (username.isEmpty || password.isEmpty || email.isEmpty) {
                      debugPrint(
                          'One of the fields is empty. Not ready to submit.');
                    } else {
                      _signUpUser(
                        username: username,
                        password: password,
                        email: email,
                      );
                    }
                  },
                ),
                Text(_errorMessage!.isNotEmpty ? _errorMessage! : ''),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
