import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sistem/models/app_theme.dart';

class LoginPage extends StatefulWidget { //Untilised
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userController = TextEditingController();
  final appTheme = AppTheme();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children:  [const Padding(padding: EdgeInsets.only(top: 50)),
          const Image(height: 350,width: 400,image: AssetImage("assets/images/register_image.png"),),
          const Padding(padding: EdgeInsets.only(top: 50)),
          TextField(  style: const TextStyle(color: Colors.pinkAccent),// Email Field
            controller: emailController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
            ),
          ),TextField(  style: const TextStyle(color: Colors.pinkAccent), //Password Field
            obscureText: true,
            controller: userController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Username',
            ),
          ),
          TextField(   style: const TextStyle(color: Colors.pinkAccent,backgroundColor: Colors.blueAccent),//Password Field
            obscureText: true,
            controller: passwordController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
          ),
          ElevatedButton(
            child: const Text('Signup'),
            onPressed: () {
              if (kDebugMode) {
                print(emailController.text);
                print(passwordController.text);
              }
            },
          )
        ],
      ),
      ),
    );
  }
}