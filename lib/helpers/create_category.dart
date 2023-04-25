import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:uuid/uuid.dart';

import '../models/CategoryOfItems.dart';

Future<void> addCategory(String categoryName,) async {
  final categoryId = Uuid().v4();
  final now = DateTime.now();

  final newCategory = CategoryOfItems(
    id: categoryId,
    category_name: categoryName,
    
  );

  try {
    bool result = await InternetConnectionChecker().hasConnection;

    if (result != false) {
      await Amplify.DataStore.save(newCategory);
    }
  } catch (e) {
    throw Exception(e);
  }
}