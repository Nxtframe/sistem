import 'package:flutter/material.dart';
import 'package:sistem/models/app_theme.dart';
import 'package:sistem/screens/splash_screen.dart';
import 'package:sistem/theme/theme_constants.dart';
import 'package:sistem/theme/theme_manager.dart';

void main() {
  runApp(MyApp());
}
ThemeManager _themeManager = ThemeManager();

class MyApp extends StatelessWidget {
  MyApp({super.key});
  
  AppTheme appTheme = AppTheme();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'SISTEM',
      theme: LightTheme,
      darkTheme: DarkTheme,
      themeMode: _themeManager.themeMode,
      
      home: const SplashScreen(),
    );
  }
}
