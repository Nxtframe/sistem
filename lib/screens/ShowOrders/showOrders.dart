import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sistem/providers/purchaseorders_provider.dart';
import 'package:sistem/screens/ShowOrders/orderDetails.dart';
import 'package:sistem/widgets/app_bar_widget.dart';

class ShowOrders extends ConsumerWidget {
  const ShowOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final receivedOrders = ref
            .watch(purchaseOrdersProvider)
            .value
            ?.where((order) => order.received == true)
            .toList() ??
        [];
    final notReceivedOrders = ref
            .watch(purchaseOrdersProvider)
            .value
            ?.where((order) => order.received != true)
            .toList() ??
        [];

    return Scaffold(
      appBar: AppBarFragment(
        title: 'Purchase Orders',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Received Orders',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: ListView.separated(
                itemCount: receivedOrders.length,
                separatorBuilder: (context, index) => const Divider(
                  color: Colors.grey,
                ),
                itemBuilder: (context, index) {
                  final order = receivedOrders[index];
                  return ListTile(
                    title: Text(
                      'Order ID: ${order.id}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Total Price: ${order.totalPrice}'),
                    onTap: () {
                      // Navigate to order details screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              OrderDetailsScreen(order: order),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Not Received Orders',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: ListView.separated(
                itemCount: notReceivedOrders.length,
                separatorBuilder: (context, index) => const Divider(
                  color: Colors.grey,
                ),
                itemBuilder: (context, index) {
                  final order = notReceivedOrders[index];
                  return ListTile(
                    title: Text(
                      'Order ID: ${order.id}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Total Price: ${order.totalPrice}'),
                    onTap: () {
                      // Navigate to order details screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              OrderDetailsScreen(order: order),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
