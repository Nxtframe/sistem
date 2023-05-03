import 'package:flutter/material.dart';
import 'dart:async';
import 'package:sistem/services/auth/authenticated_aws.dart';
import 'package:sistem/services/auth/is_registered.dart';
import 'package:sistem/theme/app_theme.dart';

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
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    const AuthenticatedAmplify(children: IsRegistered()))));
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
