import 'package:amplify_flutter/amplify_flutter.dart';

import '../models/ModelProvider.dart';

Future<void> updateModel(
    String id, int UpdateValue, int oldValue, bool AddOrMinus) async {
  final oldModel = (await Amplify.DataStore.query(
    Inventory.classType,
    where: Inventory.ID.eq(id),
  ))
      .first;

  try {
    if (AddOrMinus == true) {
      final newModel = oldModel.copyWith(stock_no: oldValue + UpdateValue);
      await Amplify.DataStore.save(newModel);
    } else {
      final newModel = oldModel.copyWith(stock_no: oldValue - UpdateValue);
      await Amplify.DataStore.save(newModel);
    }
  } on DataStoreException catch (e) {
    safePrint('Something went wrong updating model: ${e.message}');
  }
}
