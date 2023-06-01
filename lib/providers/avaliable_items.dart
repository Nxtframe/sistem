import 'package:flutter_riverpod/flutter_riverpod.dart';

final availableItemsProvider = Provider<List<String>>((ref) {
  // Retrieve the list of available items from your data source
  // You can replace this with your actual implementation
  return ['Item 1', 'Item 2', 'Item 3'];
});
