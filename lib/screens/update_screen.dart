import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sistem/helpers/update_model.dart';
import 'package:sistem/providers/inventory_list_provider.dart';

class UpdateInventoryScreen extends ConsumerStatefulWidget {
  const UpdateInventoryScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UpdateInventoryScreenState();
}

class _UpdateInventoryScreenState extends ConsumerState<UpdateInventoryScreen> {
  final nameController = TextEditingController();
  final quantityController = TextEditingController();
  String? selectedValue;
  String? selectedValueid;
  bool addOrMinus = true;

  @override
  Widget build(BuildContext context) {
    final inventorySus = ref.watch(inventoryListProvider).value ?? [];
    final dropdownValues =
        inventorySus.map((items) => items.stock_name).toList();

    final dropdownValuesid = inventorySus.map((items) => items.id).toList();
    // final selectedInventory = selectedValue.isNotEmpty
    // ? inventorySus.firstWhere((element) => element.stock_name == selectedValue)
    // : null;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Inventory'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Select Item'),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Select Item'),
                items: dropdownValues
                    .map((value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ))
                    .toList(),
                value: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value!;
                    selectedValueid =
                        dropdownValuesid[dropdownValues.indexOf(value)];
                  });
                },
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  const Text('Quantity: '),
                  Text(
                    (selectedValue == null
                        ? ''
                        : inventorySus
                            .firstWhere((element) =>
                                element.stock_name == selectedValue)
                            .stock_no
                            .toString()),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(width: 8.0),
                  addOrMinus
                      ? const Icon(
                          Icons.arrow_circle_up_rounded,
                          color: Colors.green,
                        )
                      : const Icon(
                          Icons.arrow_circle_down_rounded,
                          color: Colors.red,
                        ),
                ],
              ),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() => addOrMinus = true);
                      },
                      child: const Text('Add')),
                  ElevatedButton(
                      onPressed: () {
                        setState(() => addOrMinus = false);
                      },
                      child: const Text('Minus')),
                ],
              ),
              TextFormField(
                controller: quantityController,
                keyboardType: TextInputType.number,
                decoration:
                    const InputDecoration(hintText: 'Enter inventory quantity'),
              ),
              const SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  if (quantityController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please enter a quantity')),
                    );
                  } else {
                    updateModel(
                      selectedValueid!,
                      int.parse(quantityController.text),
                      inventorySus
                          .firstWhere(
                              (element) => element.stock_name == selectedValue)
                          .stock_no!,
                      addOrMinus, // <-- fix here
                    );
                    Navigator.of(context).pop();
                  }
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Update Inventory ',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Icon(
                      addOrMinus ? Icons.add : Icons.remove,
                      size: 24.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
