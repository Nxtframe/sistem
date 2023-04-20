import 'dart:async';
import 'dart:convert';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:sistem/models/ModelProvider.dart';

final noOfCategoryProvider = StreamProvider.autoDispose<int>((ref) {
  // Start with an initial value of 0
  int noOfCategory = 0;

  // Create a StreamController to emit updated values
  StreamController<int> controller = StreamController<int>();

  // Listen to changes to the CategoryOfItems data model in the Amplify DataStore
  StreamSubscription<QuerySnapshot<CategoryOfItems>> subscription = Amplify.DataStore.observeQuery(CategoryOfItems.classType).listen((event) {
    // When a change occurs, update the noOfCategory value
    noOfCategory = event.items.length;
    // Emit the updated value to the controller
    controller.add(noOfCategory);
  });

  ref.onDispose(() {
    subscription.cancel();
    controller.close();
  });

  // Return the stream from the StreamController
  return controller.stream;
});
