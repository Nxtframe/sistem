import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sistem/models/app_theme.dart';
import 'package:sistem/screens/homepage.dart';
import 'package:sistem/screens/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  AppTheme appTheme =  AppTheme();

   @override
    void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
          ()=>Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder:
                                                          (context) => 
                                                          const LoginPage()
                                                         )
                                       )
         );
  }
  
  
  @override
  Widget build(BuildContext context) {
 

    return Scaffold(
      backgroundColor: Color(appTheme.backgroundColor),
      body: Center(
        child: SizedBox(height: 200,width: 200,
          child: 
        Image.asset("assets/images/icon.png")),
      ),
    );
  }
}