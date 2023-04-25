import 'package:shared_preferences/shared_preferences.dart';
import 'package:sistem/services/auth/is_registered.dart';

Future<void> isRegisteredSP() async {
  //Check if user has filled the Registration form
  SharedPreferences prefs;
  prefs = await SharedPreferences
      .getInstance(); // (P3)Make DRY Code Create a Class and Run the SharedPeferences after each class runs bruh
  prefs.setBool('isRegistered', true);
}
