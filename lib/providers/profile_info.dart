import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

FutureProvider<String> userInfo = FutureProvider<String>((ref) async {
  // your asynchronous logic to get the string
  try {
    final result = await Amplify.Auth.fetchUserAttributes();
    for (final attribute in result) {
      if (attribute.userAttributeKey ==
          CognitoUserAttributeKey.preferredUsername) {
        return attribute.value;
      }
    }
    return '';
  } on AuthException {
    return '';
  }
});

FutureProvider<String?> userInfoId = FutureProvider<String?>((ref) async {
  // your asynchronous logic to get the string
  try {
    final result = await Amplify.Auth.fetchUserAttributes();
    for (final attribute in result) {
      if (attribute.userAttributeKey == CognitoUserAttributeKey.sub) {
        return attribute.value;
      }
    }
    return null;
  } on AuthException {
    return null;
  }
});
