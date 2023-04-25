import 'dart:async';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/CategoryOfItems.dart';

final categoryListProvider =
    StreamProvider.autoDispose<List<CategoryOfItems>>((ref) {
  List<CategoryOfItems> categoryList = [];

  StreamController<List<CategoryOfItems>> controller =
      StreamController<List<CategoryOfItems>>();

  // Listen to changes to the CategoryOfItems data model in the Amplify DataStore
  StreamSubscription<QuerySnapshot<CategoryOfItems>> subscription =
      Amplify.DataStore.observeQuery(CategoryOfItems.classType).listen((event) {
    // When a change occurs, update the categoryList
    categoryList = event.items;
    // Emit the updated categoryList to the controller
    controller.add(categoryList);
  });

  ref.onDispose(() {
    subscription.cancel();
    controller.close();
  });

  // Return the stream from the StreamController
  return controller.stream;
});
