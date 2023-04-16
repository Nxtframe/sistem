import 'package:amplify_api/amplify_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sistem/providers/is_signed_in_provider.dart';
import 'package:sistem/screens/homepage.dart';
import 'package:sistem/screens/signin_page.dart';
import 'package:sistem/theme/app_theme.dart';
import 'package:sistem/screens/splash_screen.dart';
import 'package:sistem/services/auth/authenticated_aws.dart';
import 'package:sistem/theme/theme_constants.dart';
import 'package:sistem/theme/theme_manager.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'amplifyconfiguration.dart';
import 'models/ModelProvider.dart';
import 'package:amplify_datastore/amplify_datastore.dart';



void main() {
  runApp( ProviderScope( child:MyApp()));
}

ThemeManager _themeManager = ThemeManager();

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
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
      final datastorePlugin =
        AmplifyDataStore(modelProvider: ModelProvider.instance);
      await Amplify.addPlugins([datastorePlugin, api,auth]);
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
        'homepage': (context) {
    final signedIn = ref.watch(signInorNot);
    if (signedIn == true) {
      return HomePage();
    } else {
      return SignInPage();
    }
  },
      },
    );
  }
}
