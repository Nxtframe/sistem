import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:sistem/models/ModelProvider.dart';
import 'package:sistem/providers/oranganization_provider.dart';
import 'package:uuid/uuid.dart';

Future<void> saveInventory(String stockName, String categoryId,
    double stockPrice, int stockNo, List<String> stockImage, ref) async {
  final organisationid = ref.watch(organizationIdProvider).value;
  final now = DateTime.now();
  final formattedDate =
      '${now.year}-${_addLeadingZero(now.month)}-${_addLeadingZero(now.day)}';

  final newInventory = Inventory(
      stock_image: stockImage,
      stock_name: stockName,
      stock_price: stockPrice,
      stock_created: formattedDate,
      id: const Uuid().v4(),
      //Save Organisation to Provider man
      //Save Category
      stock_no: stockNo,
      categoryofitemsID: categoryId,
      organizationID: organisationid);

  final changeStock = StockTransaction(
      organizationID: organisationid,
      date: TemporalDate(DateTime.parse(formattedDate)),
      id: const Uuid().v4(),
      quantity: stockNo);

  await Amplify.DataStore.save(changeStock);
  await Amplify.DataStore.save(newInventory);
}

String _addLeadingZero(int number) {
  return number.toString().padLeft(2, '0');
}
