import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:sistem/models/Inventory.dart';
import 'package:sistem/providers/oranganization_provider.dart';
import 'package:uuid/uuid.dart';

Future<void> saveInventory(
    String stockName, String categoryId, double stockPrice, ref) async {
  final organisationid = ref.watch(organizationIdProvider).value;
  final now = DateTime.now();
  final formattedDate =
      '${now.year}-${_addLeadingZero(now.month)}-${_addLeadingZero(now.day)}';

  final newInventory = Inventory(
      stock_name: stockName,
      stock_price: stockPrice,
      stock_created: formattedDate,
      id: const Uuid().v4(),
      //Save Organisation to Provider man
      //Save Category
      categoryofitemsID: categoryId,
      organizationID: organisationid);

  await Amplify.DataStore.save(newInventory);
}

String _addLeadingZero(int number) {
  return number.toString().padLeft(2, '0');
}
