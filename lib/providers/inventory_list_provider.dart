import 'dart:async';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sistem/models/ModelProvider.dart';

import '../models/Inventory.dart';
import 'oranganization_provider.dart';

final inventoryListProvider =
    StreamProvider.autoDispose<List<Inventory>>((ref) {
  final organizationId = ref.watch(organizationIdProvider).value;
  List<Inventory> inventoryList = [];

  StreamController<List<Inventory>> controller =
      StreamController<List<Inventory>>();

  // Listen to changes to Inventory data in Amplify DataStore
  StreamSubscription<QuerySnapshot<Inventory>> subscription =
      Amplify.DataStore.observeQuery(Inventory.classType,
              where: Inventory.ORGANIZATIONID.eq(organizationId))
          .listen((event) {
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
