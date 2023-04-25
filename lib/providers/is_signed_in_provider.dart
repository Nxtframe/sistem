import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signInorNot = FutureProvider<bool>((ref) async {
  try {
    await Amplify.Auth.fetchAuthSession();
    return true;
  } catch (e) {
    return false;
  }
});
