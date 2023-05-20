import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sistem/models/PurchaseOrders.dart';
import 'package:sistem/providers/oranganization_provider.dart';

final purchaseOrdersProvider =
    FutureProvider<List<PurchaseOrders>>((ref) async {
  // Fetch the purchase orders from your data source (e.g., API, database)
  // and return them as a list of PurchaseOrders
  return await fetchPurchaseOrders(ref);
});

// Example function to fetch purchase orders
Future<List<PurchaseOrders>> fetchPurchaseOrders(
    FutureProviderRef<List<PurchaseOrders>> ref) async {
  // Replace this with your own implementation to fetch the purchase orders
  // from your data source (e.g., API, database)
  // and convert the data into a list of PurchaseOrders objects
  final orgid = ref.watch(organizationIdProvider).value;

  final purchaseorder = await Amplify.DataStore.query(PurchaseOrders.classType,
      where: PurchaseOrders.ORGANIZATIONID.eq(orgid));
  return purchaseorder;
}
