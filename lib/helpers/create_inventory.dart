
// import 'package:amplify_flutter/amplify_flutter.dart';
// import 'package:sistem/models/Inventory.dart';
// import 'package:uuid/uuid.dart';

// class CreateInventory {

//     CreateInventory({

//     });

//   Future<void> saveEmployee(String stockName, ) async {
//    final now = DateTime.now();
//   final formattedDate = '${now.year}-${_addLeadingZero(now.month)}-${_addLeadingZero(now.day)}';

//   final newInventory = Inventory(
//     stock_name: stockName,
//     stock_created: formattedDate,
//     id: Uuid().v4(),
//     //Save Organisation to Provider man
//     //Save Category
//     categoryofitemsID: 

//   );

//   await Amplify.DataStore.save(newInventory);
// }

// String _addLeadingZero(int number) {
//   return number.toString().padLeft(2, '0');
// }
// }
