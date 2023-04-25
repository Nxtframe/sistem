import 'dart:async';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sistem/helpers/query_database_exists.dart';
import 'package:sistem/models/Inventory.dart';
import 'package:sistem/providers/category_provider.dart';

import '../models/CategoryOfItems.dart';

class AddInventory extends ConsumerStatefulWidget {
  const AddInventory({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddInventoryState();
}

class _AddInventoryState extends ConsumerState<AddInventory> {
  final TextEditingController stockNameController = TextEditingController();
  final TextEditingController stockOrganizationIdController =
      TextEditingController();
  final TextEditingController stockNoController = TextEditingController();
  final TextEditingController stockSoldController = TextEditingController();
  final TextEditingController stockSoldTodayController =
      TextEditingController();
  final TextEditingController stockLastAddedController =
      TextEditingController();
  final TextEditingController stockCreatedController = TextEditingController();
  final TextEditingController stockCategoryController = TextEditingController();
  final TextEditingController categoryIdController = TextEditingController();
  final TextEditingController inventoryOrganization2InventoryIdController =
      TextEditingController();

  List<String?> _dropdownValues = []; // options for dropdown
  String? _selectedValue; // currently selected option

  @override
  void initState() {
    super.initState();
    _fetchDropdownOptions();
  }

  @override
  void dispose() {
    stockNameController.dispose();
    stockOrganizationIdController.dispose();
    stockNoController.dispose();
    stockSoldController.dispose();
    stockSoldTodayController.dispose();
    stockLastAddedController.dispose();
    stockCreatedController.dispose();
    stockCategoryController.dispose();
    categoryIdController.dispose();
    inventoryOrganization2InventoryIdController.dispose();
    super.dispose();
  }

  Future<void> _fetchDropdownOptions() async {
    try {
      final items = await Amplify.DataStore.query(CategoryOfItems.classType);
      final options = items.map((item) => item.category_name).toList();
      setState(() {
        _dropdownValues = options;
      });
    } catch (e) {
      print('Error fetching dropdown options: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    var noofCategory = ref.watch(noOfCategoryProvider).value;
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Inventory'),
        ),
        body: Column(children: [
          Row(
            children: [
              SizedBox(
                height: 100,
              ),
              SizedBox(
                child: Column(
                  children: [Text('Categories'), Text('$noofCategory')],
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  SizedBox(
                    child: Column(
                      children: [Text('Items'), Text("test")],
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  SizedBox(
                    child: Column(
                      children: [Text('Total'), Text("test")],
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  SizedBox(
                    child: Column(
                      children: [Text('Total Value'), Text("test")],
                    ),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Category'),
                items: _dropdownValues
                    .map((value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value!),
                        ))
                    .toList(),
                value: _selectedValue,
                onChanged: (value) {
                  setState(() {
                    _selectedValue = value;
                  });
                },
              ),
              TextFormField(
                controller: stockNoController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'No of Stock'),
              ),
              TextFormField(
                controller: stockNoController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Stock Name'),
              ),
              SizedBox(height: 16.0),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {},
                child: Text('Add Inventory'),
              )
            ],
          )
        ]));
  }
}
