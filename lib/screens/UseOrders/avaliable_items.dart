import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sistem/models/Inventory.dart';
import 'package:sistem/providers/inventory_list_provider.dart';
import 'package:sistem/widgets/app_bar_widget.dart';

class AvailableItemsWidget extends ConsumerStatefulWidget {
  final void Function(Inventory, int) onInventorySelected;

  const AvailableItemsWidget({Key? key, required this.onInventorySelected})
      : super(key: key);

  @override
  _AvailableItemsWidgetState createState() => _AvailableItemsWidgetState();
}

class _AvailableItemsWidgetState extends ConsumerState<AvailableItemsWidget> {
  final _quantityTextControllers = <String, TextEditingController>{};

  @override
  Widget build(BuildContext context) {
    final inventoryList = ref.watch(inventoryListProvider).value ?? [];

    return Scaffold(
      appBar: AppBarFragment(
        title: 'Avaliable Items',
      ),
      body: Column(
        children: [
          SizedBox(
            height: 500,
            child: ListView.builder(
              itemCount: inventoryList.length,
              itemBuilder: (context, index) {
                final inventory = inventoryList[index];

                return ListTile(
                  title: Text(inventory.stock_name),
                  onTap: () {
                    _showQuantityDialog(context, inventory);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showQuantityDialog(
      BuildContext context, Inventory inventory) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Select Quantity'),
          content: QuantityDialog(
            onQuantitySelected: (quantity) {
              widget.onInventorySelected(inventory, quantity);
            },
          ),
        );
      },
    );
  }
}

class QuantityDialog extends StatefulWidget {
  final void Function(int) onQuantitySelected;

  const QuantityDialog({Key? key, required this.onQuantitySelected})
      : super(key: key);

  @override
  _QuantityDialogState createState() => _QuantityDialogState();
}

class _QuantityDialogState extends State<QuantityDialog> {
  final TextEditingController textController = TextEditingController(text: '1');
  bool isButtonVisible = false;

  @override
  void initState() {
    super.initState();
    textController.addListener(updateButtonVisibility);
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void updateButtonVisibility() {
    final value = textController.text;
    final isEmpty = value.isEmpty;
    final number = int.tryParse(value);
    final isValidNumber = number != null && number >= 1;
    setState(() {
      isButtonVisible = !isEmpty && isValidNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Slider(
            value: double.tryParse(textController.text) ?? 1,
            min: 1,
            max: 10000,
            onChanged: (value) {
              setState(() {
                textController.text = value.toStringAsFixed(0);
              });
            },
          ),
          TextFormField(
            autofocus: true,
            controller: textController,
            keyboardType: TextInputType.number,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a value';
              }
              final number = int.tryParse(value);
              if (number == null || number < 1) {
                return 'Please enter a valid number greater than or equal to 1';
              }
              return null;
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    textController.text = '100';
                  });
                },
                child: const Text('100'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    textController.text = '1000';
                  });
                },
                child: const Text('1000'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    textController.text = '10000';
                  });
                },
                child: const Text('10000'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (isButtonVisible)
                TextButton(
                  onPressed: () {
                    final quantity = int.tryParse(textController.text) ?? 1;
                    widget.onQuantitySelected(quantity);
                    Navigator.pop(context); // Close the dialog
                  },
                  child: const Text('OK'),
                ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                },
                child: const Text('Cancel'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
