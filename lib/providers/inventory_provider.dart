import 'dart:convert';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final noOfFoldersProvider = FutureProvider<int>((ref) async {
  const noOfFolders = 10;
  return noOfFolders;
});

