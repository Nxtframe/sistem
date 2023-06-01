import 'dart:convert';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sistem/models/Inventory.dart';
import 'package:sistem/providers/employee_provider.dart';
import 'package:sistem/providers/oranganization_provider.dart';
import 'package:sistem/screens/Orders/inventoryList.dart';
import 'package:sistem/widgets/app_bar_widget.dart';
import 'package:uuid/uuid.dart';

import '../../models/PurchaseOrders.dart';

class AddOrderWidget extends ConsumerStatefulWidget {
  const AddOrderWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddOrderWidgetState();
}

class _AddOrderWidgetState extends ConsumerState<AddOrderWidget> {
  final _formKey = GlobalKey<FormState>();
  List<Inventory> selectedInventories = [];
  String _organizationID = '';
  String _employeeID = '';
  double? _totalPrice;
  String? _address;
  String? _comments;
  Map<String, int> inventoryObject = {};
  String? _validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the address';
    }
    return null;
  }

  void _submitForm() {
    double _calculateTotalPrice() {
      double totalPrice = 0;
      for (final inventory in selectedInventories) {
        final quantity = inventoryObject[inventory.id] ?? 0;
        totalPrice += (inventory.stock_price ?? 0) * quantity;
      }
      return totalPrice;
    }

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      List<String> inventoryItems = inventoryObject.entries
          .map((entry) => "${entry.key}:${entry.value}")
          .toList();
      safePrint('My Inventory $inventoryItems');
      double totalPrice = _calculateTotalPrice();
      PurchaseOrders newOrder = PurchaseOrders(
          id: const Uuid().v4(),
          organizationID: _organizationID,
          employeeID: _employeeID,
          totalPrice: totalPrice,
          address: _address,
          comments: _comments,
          noofinventoryitems: jsonEncode(inventoryObject));

      // Perform further actions with the order data
      Amplify.DataStore.save(newOrder).then((value) => setState(() {
            _formKey.currentState!.reset();
            selectedInventories.clear();
          }));
      // Clear the form fields
      _formKey.currentState!.reset();
      selectedInventories.clear();

      // Show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Order submitted successfully')),
      );
      setState(() {
        inventoryObject.clear();
      });
    }
  }

  void _removeInventory(Inventory inventory) {
    setState(() {
      selectedInventories.remove(inventory);
    });
  }

  @override
  Widget build(BuildContext context) {
    final organisation = ref.watch(organization).value;
    final employee = ref.watch(employeeProvider).value;
    _employeeID = employee?.id ?? '';
    _organizationID = organisation?.id ?? 'Error Quering';
    return Scaffold(
        appBar: AppBarFragment(
          title: 'Add New Orders',
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InventoryList(
                                onInventorySelected: (inventory, quantity) {
                              setState(() {
                                selectedInventories.add(inventory);
                                inventoryObject[inventory.id] = quantity;
                              });
                            }),
                          ),
                        );
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.add,
                            size: 40,
                            color: Colors.blue,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Add Item',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text('Selected Inventories:'),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: selectedInventories.length,
                        itemBuilder: (context, index) {
                          final inventory = selectedInventories[index];
                          final quantity = inventoryObject[inventory.id] ?? 0;

                          return ListTile(
                            title: RichText(
                              text: TextSpan(
                                text: '${inventory.stock_name}: ',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(
                                    text: '$quantity',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => _removeInventory(inventory),
                            ),
                          );
                        },
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'Organisation name:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          organisation?.organization_name ??
                              'Error fetching organisation name',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.blue,
                          ),
                        ),
                        const Text(
                          'User ID:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          employee?.id ?? 'Error fetching user Id',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.blue,
                          ),
                        ),
                        TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'Address'),
                          onSaved: (newValue) => _address = newValue!,
                          validator: _validateAddress,
                        ),
                        TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'Comments'),
                          onSaved: (newValue) => _comments = newValue!,
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: _submitForm,
                          child: const Text('Submit Order'),
                        ),
                      ],
                    ),
                  ]),
            ),
          ),
        ));
  }
}
