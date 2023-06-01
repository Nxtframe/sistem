import 'dart:convert';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sistem/models/ModelProvider.dart';
import 'package:sistem/providers/oranganization_provider.dart';
import 'package:sistem/widgets/app_bar_widget.dart';
import 'package:uuid/uuid.dart';

class OrderDetailsScreen extends ConsumerWidget {
  final PurchaseOrders order;

  const OrderDetailsScreen({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orgId = ref.watch(organizationIdProvider).value;
    final bool isOrderReceived = order.received ?? false;

    return Scaffold(
      appBar: AppBarFragment(
        title: 'Order Details',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Order ID: ${order.id}'),
            const SizedBox(height: 8.0),
            Text('Total Price: ${order.totalPrice}'),
            const SizedBox(height: 8.0),
            Text('Address: ${order.address}'),
            const SizedBox(height: 8.0),
            Text('Comments: ${order.comments}'),
            const SizedBox(height: 16.0),
            if (!isOrderReceived)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      final updatedOrder = PurchaseOrders(
                        id: order.id,
                        organizationID: order.organizationID,
                        employeeID: order.employeeID,
                        totalPrice: order.totalPrice,
                        address: order.address,
                        comments: order.comments,
                        received: true,
                        noofinventoryitems: order.noofinventoryitems,
                      );
                      Amplify.DataStore.save(updatedOrder).then((value) async {
                        // Decode the JSON string
                        final decodedItems =
                            jsonDecode(order.noofinventoryitems!)
                                as Map<String, dynamic>;

                        // Update the quantities of each inventory item
                        for (var entry in decodedItems.entries) {
                          final itemId = entry.key;
                          final quantity = entry.value;

                          final queryResult = await Amplify.DataStore.query(
                              Inventory.classType,
                              where: Inventory.ID.eq(itemId));
                          final List<Inventory> items = queryResult;

                          if (items.isNotEmpty) {
                            final item = items.first;
                            final updatedItem = item.copyWith(
                                stock_no: item.stock_no! +
                                    int.parse(quantity.toString()));

                            await Amplify.DataStore.save(updatedItem);

                            final stockTrans = StockTransaction(
                                organizationID: orgId!,
                                date: TemporalDate.now(),
                                id: const Uuid().v4(),
                                quantity: quantity);

                            await Amplify.DataStore.save(stockTrans);
                          }
                        }

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Order marked as received')),
                        );
                      }).catchError((error) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content:
                                  Text('Failed to mark order as received')),
                        );
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    child: const Text('Mark as Received'),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
