import 'dart:async';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sistem/models/app_theme.dart';
import 'package:sistem/screens/confirmation_code.dart';

import '../widgets/outlined_textformfield.dart';

class LoginPage extends StatefulWidget {
  //Untilised
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _userController = TextEditingController();
  TextEditingController _activationCodeController = TextEditingController();
  late bool isSignUpComplete = false;
  late bool _isLoading;
  late String? _errorMessage;

  final appTheme = AppTheme();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _activationCodeController.dispose();
    _userController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _signUpUser(
      String username, String password, String email) async {
    if (_formKey.currentState!.validate()) {
      // (1)
      Map<CognitoUserAttributeKey, String> userAttributes = {
        CognitoUserAttributeKey.preferredUsername: username,
        // 'phone_number': '+15559101234',
        // additional attributes as needed
      };
      SignUpResult res = await Amplify.Auth.signUp(
          username: email,
          password: password,
          options: CognitoSignUpOptions(userAttributes: userAttributes));

      setState(() {
        _isLoading = true;
        _errorMessage = null;
        isSignUpComplete = res.isSignUpComplete;
      });
      if (res.isSignUpComplete) {
        debugPrint('Sign up is done. ${res.isSignUpComplete}');
      }
    }
  }

  void _verifyCode(String verificationCode) async {
    try {
      final result = await Amplify.Auth.confirmSignUp(
        username: _emailController.text.trim(),
        confirmationCode: verificationCode,
      ).then((value) => Navigator.pop(context),);
    } on AuthException catch (e) {
      print('Verification failed: ${e.message}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
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
              TextField(
                style: const TextStyle(color: Colors.pinkAccent), // Email Field
                controller: _emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),

              ),
              TextField(
                style:
                    const TextStyle(color: Colors.pinkAccent), //Password Field
                controller: _userController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
              TextField(
                style: const TextStyle(
                    color: Colors.pinkAccent,
                    backgroundColor: Colors.blueAccent), //Password Field
                controller: _passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
              ElevatedButton(
                child: const Text('Signup'),
                onPressed: () async {
                  {
                    final username = _userController.text;
                    final password = _passwordController.text;
                    final email = _emailController.text;
                    if (username.isEmpty || password.isEmpty || email.isEmpty) {
                      debugPrint(
                          'One of the fields is empty. Not ready to submit.');
                    } else {
                      _signUpUser(username, password, email)
                          .then((value) => showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                      title: const Text('Confirm the user'),
                                      content: Column(children: [
                                        TextFormField(
                                          controller: _activationCodeController,
                                          decoration: const InputDecoration(
                                              hintText: "Confirmation Code"),
                                        ),ElevatedButton(onPressed: (){
                                                _verifyCode(_activationCodeController.text);
                                            }, child: const Text("Confirm"))
                                      ]));
                                },
                              ));
                    }
                  }
                  ;
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
