// ignore_for_file: prefer_const_constructors
// P# = Priority #=1-5
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:sistem/helpers/query_database_exists.dart';
import 'package:sistem/screens/confirmation_code.dart';
import 'package:sistem/screens/homepage.dart';
import 'package:sistem/screens/info_input_screen.dart';
import 'package:sistem/screens/signup_page.dart';

import '../helpers/isRegisteredSP.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

final _formKey = GlobalKey<FormState>();

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isSignedIn = false;
  String userError = '';
  Future<void> _signInUser(
      {required String password, required String email}) async {
    try {
      final result = await Amplify.Auth.signIn(
        username: email,
        password: password,
      );
      bool obj = await queryDatabaseforEmail(email.toLowerCase());
      setState(() {
        isSignedIn = result.isSignedIn && obj;
      });
    } on UserNotConfirmedException catch (e) {
      // (P-2)Refactor this to Be a Global state
      throw UserNotConfirmedException(e.message);
    } on UserNotFoundException catch (e) {
      throw UserNotFoundException(e.message);
    } on AuthException catch (e) {
      throw AuthException(e.message);
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
        body: SingleChildScrollView(
      reverse: true,
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 500,
              ),
              TextField(
                style: TextStyle(color: Colors.black), // Email Field
                controller: _emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
              Text(userError.isNotEmpty ? userError : ''),
              TextField(
                style: TextStyle(color: Colors.black), // Email Field
                controller: _passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  try {
                    setState(() => userError = '');
                    await _signInUser(
                      email: _emailController.text,
                      password: _passwordController.text,
                    ).then((value) async {
                      if (isSignedIn) {
                        await isRegisteredSP()
                            .then((value) => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const HomePage(),
                                  ),
                                ));
                      } else {
                        await isRegisteredSPDestroy()
                            .then((value) => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const InfoInput(),
                                  ),
                                ));
                      }
                    });
                  } on UserNotConfirmedException {
                    // Handle the error here
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => ConfirmationCode(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                ))));
                  } on UserNotFoundException catch (e) {
                    setState(() => userError = e.message);
                  } on AuthException catch (e) {
                    setState(() => userError = e.message);
                  } catch (e) {
                    setState(() => userError = e.toString());
                  }
                },
                child: const Text('Sign in'),
              ),
              ElevatedButton(
                  onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((BuildContext context) =>
                                    const SignupPage())))
                      },
                  child: const Text("Sign Up"))
            ],
          )),
    ));
  }
}
