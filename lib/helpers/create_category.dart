import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:uuid/uuid.dart';

import '../models/CategoryOfItems.dart';
import '../providers/oranganization_provider.dart';

Future<void> addCategory(String categoryName, WidgetRef ref) async {
  final organisationName = ref.watch(organizationIdProvider).value ?? '';

  final categoryId = const Uuid().v4();

  final newCategory = CategoryOfItems(
      id: categoryId,
      category_name: categoryName,
      organizationID: organisationName);

  try {
    bool result = await InternetConnectionChecker().hasConnection;

    if (result != false) {
      await Amplify.DataStore.save(newCategory);
    }
  } catch (e) {
    throw Exception(e);
  }
}
