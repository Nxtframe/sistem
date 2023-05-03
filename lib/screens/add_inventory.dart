import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sistem/helpers/create_inventory.dart';
import 'package:sistem/providers/category_information.dart';
import 'package:sistem/providers/category_provider.dart';

class AddInventory extends ConsumerStatefulWidget {
  const AddInventory({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddInventoryState();
}

class _AddInventoryState extends ConsumerState<AddInventory> {
  final TextEditingController stockNameController = TextEditingController();
  final TextEditingController stockOrganizationIdController =
      TextEditingController();
  final TextEditingController stockPriceController = TextEditingController();
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
// options for dropdown
  String? _selectedValue; // currently selected option

  String? _selectedValueid;

  @override
  void initState() {
    super.initState();
    // _fetchDropdownOptions();
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

  // Future<void> _fetchDropdownOptions() async {
  //   try {
  //     final organizationId = ref.watch(organizationIdProvider).value;
  //     final items = await Amplify.DataStore.query(CategoryOfItems.classType,
  //         where: CategoryOfItems.ORGANIZATIONID.eq(organizationId));
  //     safePrint(items);
  //     final options = items.map((item) => item.category_name).toList();
  //     final optionsid = items.map((item) => item.id).toList();
  //     setState(() {
  //       _dropdownValuesId = optionsid;
  //       _dropdownValues = options;
  //     });
  //   } catch (e) {
  //     print('Error fetching dropdown options: $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    var noofCategory = ref.watch(noOfCategoryProvider).value;
    final foldersList = ref.watch(categoryListProvider).value;
    List<String> dropdownValues =
        foldersList?.map((items) => items.category_name ?? '').toList() ?? [];

    List<String> dropdownValuesId =
        foldersList?.map((items) => items.id).toList() ?? [];
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Inventory'),
        ),
        body: Column(children: [
          Row(
            children: [
              const SizedBox(
                height: 100,
              ),
              SizedBox(
                child: Column(
                  children: [const Text('Categories'), Text('$noofCategory')],
                ),
              ),
              Row(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  SizedBox(
                    child: Column(
                      children: const [Text('Items'), Text("test")],
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  SizedBox(
                    child: Column(
                      children: const [Text('Total'), Text("test")],
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  SizedBox(
                    child: Column(
                      children: const [Text('Total Value'), Text("test")],
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
                decoration: const InputDecoration(labelText: 'Category'),
                items: dropdownValues
                    .map((value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ))
                    .toList(),
                value: _selectedValue,
                onChanged: (value) {
                  final index = dropdownValues.indexOf(value!);
                  setState(() {
                    _selectedValue = value;
                    _selectedValueid = dropdownValuesId.elementAt(index);
                  });
                },
              ),
              TextFormField(
                controller: stockNoController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'No of Stock'),
              ),
              TextFormField(
                controller: stockNameController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Stock Name'),
              ),
              TextFormField(
                controller: stockPriceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Stock Price'),
              ),
              const SizedBox(height: 16.0),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  await saveInventory(
                          stockNameController.text,
                          _selectedValueid!,
                          double.parse(stockPriceController.text),
                          ref)
                      .then((value) => Navigator.pop(context));
                },
                child: const Text('Add Inventory'),
              )
            ],
          )
        ]));
  }
}
