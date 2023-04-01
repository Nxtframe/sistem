import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sistem/screens/signin_page.dart';
import 'package:sistem/services/auth/authenticated_aws.dart';
import 'package:sistem/theme/app_theme.dart';
import 'package:sistem/screens/homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AppTheme appTheme = AppTheme();

  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 1),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => AuthenticatedAmplify(children: const SignInPage()))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(appTheme.backgroundColor),
      body: Center(
        child: SizedBox(
            height: 200,
            width: 200,
            child: Image.asset("assets/images/icon.png")),
      ),
    );
  }
}
