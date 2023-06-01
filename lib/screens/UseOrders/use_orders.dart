import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:sistem/models/ModelProvider.dart';
import 'package:sistem/screens/UseOrders/avaliable_items.dart';
import 'package:sistem/widgets/app_bar_widget.dart';

class AddUseOrderWidget extends StatefulWidget {
  const AddUseOrderWidget({Key? key}) : super(key: key);

  @override
  _AddUseOrderWidgetState createState() => _AddUseOrderWidgetState();
}

class _AddUseOrderWidgetState extends State<AddUseOrderWidget> {
  final _formKey = GlobalKey<FormState>();
  String? _id;
  String? _comments;
  String? _recipient;
  List<String> itemList = [];
  List<Inventory> selectedInventories = [];
  Map<String, int> inventoryObject = {};

  String? _validateField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a value';
    }
    return null;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Perform further actions with the use order data
      // You can access the item list using the 'itemList' variable

      // Clear the form fields and item list
      _formKey.currentState!.reset();
      itemList.clear();
      selectedInventories.clear();
      inventoryObject.clear();

      final Orders = UseOrders(
        comments: _comments,
      );
      Amplify.DataStore.save(Orders);

      // Show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Use order submitted successfully')),
      );
    }
  }

  void _addItem() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        itemList.add(_id!);
        _id = '';
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
    return Scaffold(
      appBar: AppBarFragment(
        title: 'Add Use Order',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AvailableItemsWidget(
                              onInventorySelected: (inventory, quantity) {
                                setState(() {
                                  selectedInventories.add(inventory);
                                  inventoryObject[inventory.id] = quantity;
                                });
                              },
                            ))),
                child: const Text('Add Item'),
              ),
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
              const SizedBox(height: 16),
              const Text(
                'Items:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              ListView.builder(
                shrinkWrap: true,
                itemCount: itemList.length,
                itemBuilder: (context, index) {
                  return Text(
                    itemList[index],
                    style: const TextStyle(fontSize: 16),
                  );
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Comments'),
                onSaved: (newValue) => _comments = newValue!,
                validator: _validateField,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Recipient'),
                onSaved: (newValue) => _recipient = newValue!,
                validator: _validateField,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Submit Use Order'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
