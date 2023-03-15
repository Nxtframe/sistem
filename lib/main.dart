import 'package:flutter/material.dart';
import 'package:sistem/models/app_theme.dart';
import 'package:sistem/screens/splash_screen.dart';
import 'package:sistem/theme/theme_constants.dart';
import 'package:sistem/theme/theme_manager.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'amplifyconfiguration.dart';

void main() {
  runApp(MyApp());
}

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final appTheme = AppTheme();

  // This widget is the root of your application.
  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  Future<void> _configureAmplify() async {
    try {
      final auth = AmplifyAuthCognito();
      await Amplify.addPlugin(auth);

      // call Amplify.configure to use the initialized categories in your app
      await Amplify.configure(amplifyconfig);
    } on Exception catch (e) {
      safePrint('An error occurred configuring Amplify: $e');
    }
  }

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
