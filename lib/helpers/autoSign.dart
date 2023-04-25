//Making an AutoSign cause Amplify users are lazy

import 'package:amplify_flutter/amplify_flutter.dart';

Future<bool> autoSignin(
    {required String email, required String password}) async {
  try {
    await Amplify.Auth.signIn(
      username: email,
      password: password,
    );
    return true;
  } catch (e) {
    return false;
  }
}
