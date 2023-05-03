import 'dart:async';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sistem/models/ModelProvider.dart';

import 'oranganization_provider.dart';

final noOfCategoryProvider = StreamProvider.autoDispose<int>((ref) {
  int noOfCategory = 0;
  final organizationId = ref.watch(organizationIdProvider).value;
  StreamController<int> controller = StreamController<int>();

  // Listen to changes to the CategoryOfItems data model in the Amplify DataStore
  StreamSubscription<QuerySnapshot<CategoryOfItems>> subscription =
      Amplify.DataStore.observeQuery(CategoryOfItems.classType,
              where: CategoryOfItems.ORGANIZATIONID.eq(organizationId))
          .listen((event) {
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
