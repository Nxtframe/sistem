import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sistem/providers/is_signed_in_provider.dart';
import 'package:sistem/screens/homepage.dart';
import 'package:sistem/screens/signin_page.dart';
import 'package:sistem/theme/app_theme.dart';
import 'package:sistem/screens/splash_screen.dart';
import 'package:sistem/theme/theme_constants.dart';
import 'package:sistem/theme/theme_manager.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'amplifyconfiguration.dart';
import 'models/ModelProvider.dart';
import 'package:amplify_datastore/amplify_datastore.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
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
      final storage = AmplifyStorageS3();
      final datastorePlugin =
          AmplifyDataStore(modelProvider: ModelProvider.instance);

      if (!Amplify.isConfigured) {
        await Amplify.addPlugins([datastorePlugin, api, auth, storage]);
        await Amplify.configure(amplifyconfig);
      }

      // call Amplify.configure to use the initialized categories in your app
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
        '/': (context) => const SplashScreen(),
        'signIn': (context) => const SignInPage(),
        'homepage': (context) {
          final signedIn = ref.watch(signInorNot).value;
          if (signedIn == true) {
            return const HomePage();
          } else {
            return const SignInPage();
          }
        },
      },
    );
  }
}
