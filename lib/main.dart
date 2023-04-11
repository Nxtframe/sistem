import 'package:amplify_api/amplify_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sistem/screens/signin_page.dart';
import 'package:sistem/theme/app_theme.dart';
import 'package:sistem/screens/splash_screen.dart';
import 'package:sistem/services/auth/authenticated_aws.dart';
import 'package:sistem/theme/theme_constants.dart';
import 'package:sistem/theme/theme_manager.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'amplifyconfiguration.dart';


final helloWorldProvider = Provider((_) => 'Hello world');

void main() {
  runApp( ProviderScope( child:MyApp()));
}

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

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
      final api = AmplifyAPI();
      await Amplify.addPlugin(auth);
      await Amplify.addPlugin(api);
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
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        'signIn': (context) => SignInPage(),
        
      },
    );
  }
}
