import 'dart:async';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sistem/providers/oranganization_provider.dart';

import '../models/Inventory.dart';

final inventoryListProvider =
    StreamProvider.autoDispose<List<Inventory>>((ref) {
  final organizationId = ref.watch(organizationIdProvider).value;
  List<Inventory> inventoryList = [];

  StreamController<List<Inventory>> controller =
      StreamController<List<Inventory>>();

  // Fetch initial data from Amplify DataStore
  Amplify.DataStore.query(Inventory.classType,
          where: Inventory.ORGANIZATIONID.eq(organizationId))
      .then((result) {
    inventoryList = result;
    controller.add(inventoryList);
  }).catchError((error) {
    // Handle error, if any
    print('Error fetching initial data: $error');
  });

  // Listen to changes to Inventory data in Amplify DataStore
  StreamSubscription<QuerySnapshot<Inventory>> subscription =
      Amplify.DataStore.observeQuery(
    Inventory.classType,
    where: Inventory.ORGANIZATIONID.eq(organizationId),
  ).listen((event) {
    inventoryList = event.items;
    controller.add(inventoryList);
  });

  ref.onDispose(() {
    subscription.cancel();
    controller.close();
  });

  // Return the stream from the StreamController
  return controller.stream;
});
