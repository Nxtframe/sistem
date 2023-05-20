import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:sistem/models/PurchaseOrders.dart';

class OrderDetailsScreen extends StatelessWidget {
  final PurchaseOrders order;

  const OrderDetailsScreen({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isOrderReceived = order.received ?? false;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Details'),
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

                      Amplify.DataStore.save(updatedOrder).then((value) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Order marked as received')),
                        );
                        Navigator.pop(context);
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
