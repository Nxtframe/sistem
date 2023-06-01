import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sistem/models/PurchaseOrders.dart';
import 'package:sistem/providers/oranganization_provider.dart';

final purchaseOrdersProvider = StreamProvider<List<PurchaseOrders>>((ref) {
  final orgid = ref.watch(organizationIdProvider).value;

  final stream = Amplify.DataStore.observeQuery(
    PurchaseOrders.classType,
    where: PurchaseOrders.ORGANIZATIONID.eq(orgid),
  );

  return stream.map((querySnapshot) => querySnapshot.items.toList());
});

final purchaseOrdersFamilyProvider =
    FutureProvider.family<List<PurchaseOrders>, String>((ref, orgid) async {
  final purchaseOrders = await Amplify.DataStore.query(
    PurchaseOrders.classType,
    where: PurchaseOrders.ORGANIZATIONID.eq(orgid),
  );

  return purchaseOrders;
});
