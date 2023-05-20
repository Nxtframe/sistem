import 'dart:async';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sistem/models/ModelProvider.dart';

import 'oranganization_provider.dart';

final totalStockProvider =
    StreamProvider.autoDispose<List<StockTransaction>>((ref) {
  final organizationId = ref.watch(organizationIdProvider).value;
  List<StockTransaction> totalStockList = [];

  StreamController<List<StockTransaction>> controller =
      StreamController<List<StockTransaction>>();

  // Listen to changes to CategoryOfItems data in Amplify DataStore
  StreamSubscription<QuerySnapshot<StockTransaction>> subscription =
      Amplify.DataStore.observeQuery(StockTransaction.classType,
              where: StockTransaction.ORGANIZATIONID.eq(
                  organizationId)) //Next change use the query_query functions
          .listen((event) {
    totalStockList = event.items;
    controller.add(totalStockList);
  });

  ref.onDispose(() {
    subscription.cancel();
    controller.close();
  });

  // Return the stream from the StreamController
  return controller.stream;
});
