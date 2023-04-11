import 'dart:async';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sistem/screens/single_inventory.dart';
import 'package:sistem/theme/app_theme.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _userController = TextEditingController();
  TextEditingController _activationCodeController = TextEditingController();
  late bool isSignUpComplete = false;
  late bool _confirmCodeFailed = false;
  late bool _isLoading;
  late String? _errorMessage;

  final appTheme = AppTheme();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _userController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _signUpUser(
      {required String username,
      required String password,
      required String email}) async {
    if (_formKey.currentState!.validate()) {
      Map<CognitoUserAttributeKey, String> userAttributes = {
        //Send additional attributes here
        CognitoUserAttributeKey.preferredUsername: username,
      };
      SignUpResult res = await Amplify.Auth.signUp(
          username: email, //username = email because Email Sign up
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
      await Amplify.Auth.confirmSignUp(
        username: _emailController.text.trim(),
        confirmationCode: verificationCode,
      ).then(
        (value) => Navigator.pop(context),
      );
    } on AuthException catch (e) {
      debugPrint("$e");
      _emailController.clear();
      _confirmCodeFailed = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          // decoration: const BoxDecoration(color: Colors.white),
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
                  style: const TextStyle(color: Colors.black), // Email Field
                  controller: _emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
                TextField(
                  style: const TextStyle(
                      color: Colors.pinkAccent), //Password Field
                  controller: _userController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                  ),
                ),
                TextField(
                  style: const TextStyle(
                    color: Colors.pinkAccent,
                  ), //Password Field
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
                      if (username.isEmpty ||
                          password.isEmpty ||
                          email.isEmpty) {
                        debugPrint(
                            'One of the fields is empty. Not ready to submit.');
                      } else {
                        _signUpUser(
                                username: username,
                                password: password,
                                email: email)
                            .then((value) => showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                        title: const Text('Confirm the user'),
                                        content: Column(children: [
                                          TextFormField(
                                            controller:
                                                _activationCodeController,
                                            decoration: const InputDecoration(
                                                hintText: "Confirmation Code"),
                                          ),
                                          Column(
                                            children: [
                                              ElevatedButton(
                                                  onPressed: () {
                                                    _verifyCode(
                                                        _activationCodeController
                                                            .text);
                                                  },
                                                  child: const Text("Confirm")),
                                              _confirmCodeFailed
                                                  ? const Text(
                                                      "Confirmation Code Wrong")
                                                  : const SizedBox.shrink()
                                            ],
                                          )
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
      ),
    );
  }
}
