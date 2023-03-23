import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:sistem/screens/login_page.dart';

class AuthenticatedAmplify extends StatefulWidget {
 
  const AuthenticatedAmplify({super.key, required this.children});
  final Widget children;
  
  @override
  State<AuthenticatedAmplify> createState() => _AuthenticatedAmplifyState();
}



class _AuthenticatedAmplifyState extends State<AuthenticatedAmplify> {

 
  
   bool _isAuthenticated = false;

  @override
  void initState() {
    super.initState();
    _checkAuthStatus();
  }

  void _checkAuthStatus() async {
    try {
      // Check if the user is authenticated
      AuthSession authSession = await Amplify.Auth.fetchAuthSession();
      setState(() {
        _isAuthenticated = authSession.isSignedIn;
      });
    } on AmplifyException catch (e) {
      print("Failed to get auth session: ${e.message}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isAuthenticated? widget.children:  const LoginPage();
  }
}