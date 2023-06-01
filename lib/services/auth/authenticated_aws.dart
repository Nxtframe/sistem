import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:sistem/screens/signup_page.dart';
import 'package:sistem/theme/theme_constants.dart';

import '../../screens/signin_page.dart';

class AuthenticatedAmplify extends StatefulWidget {
  const AuthenticatedAmplify({super.key, required this.children});
  final Widget children;

  @override
  State<AuthenticatedAmplify> createState() => _AuthenticatedAmplifyState();
}

class _AuthenticatedAmplifyState extends State<AuthenticatedAmplify> {
  @override
  void initState() {
    super.initState();
    _checkAuthStatus();
  }

  Future<bool> _checkAuthStatus() async {
    try {
      // Check if the user is authenticated
      AuthSession authSession = await Amplify.Auth.fetchAuthSession();
      return authSession.isSignedIn;
    } on AmplifyException catch (e) {
      print("Failed to get auth session: ${e.message}");
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _checkAuthStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));
        } else if (snapshot.hasError) {
          return const Text(
              "Error occurred while checking authentication status");
        } else if (snapshot.data == true) {
          return widget.children;
        } else if (snapshot.data == false) {
          return MaterialApp(
              theme: LightTheme, home: const Scaffold(body: SignInPage()));
        } else {
          return MaterialApp(
              theme: LightTheme, home: const Scaffold(body: SignupPage()));
        }
      },
    );
  }
}
