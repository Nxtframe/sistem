import 'dart:async';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/CategoryOfItems.dart';
import 'oranganization_provider.dart';

final categoryListProvider =
    StreamProvider.autoDispose<List<CategoryOfItems>>((ref) {
  final organizationId = ref.watch(organizationIdProvider).value;
  List<CategoryOfItems> categoryList = [];

  StreamController<List<CategoryOfItems>> controller =
      StreamController<List<CategoryOfItems>>();

  // Listen to changes to CategoryOfItems data in Amplify DataStore
  StreamSubscription<QuerySnapshot<CategoryOfItems>> subscription =
      Amplify.DataStore.observeQuery(CategoryOfItems.classType,
              where: CategoryOfItems.ORGANIZATIONID.eq(
                  organizationId)) //Next change use the query_query functions
          .listen((event) {
    categoryList = event.items;
    controller.add(categoryList);
  });

  ref.onDispose(() {
    subscription.cancel();
    controller.close();
  });

  // Return the stream from the StreamController
  return controller.stream;
});
