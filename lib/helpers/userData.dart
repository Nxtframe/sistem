import 'package:amplify_flutter/amplify_flutter.dart';

Future<String?> usersEmail() async {
  try {
    var attributes = (await Amplify.Auth.fetchUserAttributes()).toList();
    for (var attribute in attributes) {
      if (attribute.userAttributeKey.toString() == 'email') {
        return attribute.value.toString();
      }
    }
    return null;
  } on AuthException catch (e) {
    return null;
  }
}