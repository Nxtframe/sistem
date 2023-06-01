import 'dart:io';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:sistem/helpers/create_inventory.dart';
import 'package:sistem/models/ModelProvider.dart';
import 'package:sistem/providers/category_information.dart';
import 'package:sistem/providers/category_provider.dart';
import 'package:sistem/providers/oranganization_provider.dart';
import 'package:sistem/widgets/app_bar_widget.dart';
import 'package:uuid/uuid.dart';

class AddInventory extends ConsumerStatefulWidget {
  const AddInventory({Key? key}) : super(key: key);

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
  final List<File> _imageFiles = [];
  final List<String> _uploadedImageUrls = [];

  String? _selectedValue;
  String? _selectedValueid;

  Future<void> _pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _imageFiles.add(File(pickedImage.path));
      });
    }
  }

  Future<void> _uploadImages() async {
    try {
      for (final file in _imageFiles) {
        const uuid = Uuid();
        final key = 'images/${uuid.v4()}';
        final result = await Amplify.Storage.uploadFile(
          key: key,
          local: file,
        );
        _uploadedImageUrls.add(key);
      }
    } catch (e) {
      print('Error uploading images: $e');
    }
  }

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
    final orgId = ref.watch(organizationIdProvider).value ?? '';
    List<String> dropdownValues =
        foldersList?.map((items) => items.category_name ?? '').toList() ?? [];
    List<String> dropdownValuesId =
        foldersList?.map((items) => items.id).toList() ?? [];

    return Scaffold(
      appBar: AppBarFragment(
        title: 'Add Inventories',
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            _imageFiles.isNotEmpty
                ? CarouselSlider(
                    options: CarouselOptions(
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      enableInfiniteScroll: false,
                      enlargeCenterPage: true,
                    ),
                    items: _imageFiles
                        .map(
                          (file) => Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.file(
                                    file,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 8.0,
                                right: 8.0,
                                child: IconButton(
                                  icon: const Icon(Icons.delete),
                                  color: Colors.red,
                                  onPressed: () {
                                    setState(() {
                                      _imageFiles
                                          .removeAt(_imageFiles.indexOf(file));
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        )
                        .toList(),
                  )
                : Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.image,
                        size: 64,
                        color: Colors.grey,
                      ),
                    ),
                  ),
            ElevatedButton(
              onPressed: _imageFiles.length < 3 ? _pickImage : null,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.add_a_photo),
                  SizedBox(width: 4),
                  Text('Add Image'),
                ],
              ),
            ),
            Row(
              children: [
                const SizedBox(height: 100),
                SizedBox(
                  child: Column(
                    children: [
                      const Text(
                        'Available Categories',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '$noofCategory',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'Category'),
                  items: dropdownValues
                      .map(
                        (value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ),
                      )
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
                  decoration: const InputDecoration(labelText: 'Stock Name'),
                ),
                TextFormField(
                  controller: stockPriceController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Stock Price'),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    await _uploadImages();
                    final List<String> imageUrls = List<String>.from(
                      _uploadedImageUrls,
                    );
                    await saveInventory(
                      stockNameController.text,
                      _selectedValueid!,
                      double.parse(stockPriceController.text),
                      int.parse(stockNoController.text),
                      imageUrls,
                      ref,
                    );
                    await Amplify.DataStore.save(StockTransaction(
                            organizationID: orgId,
                            date: TemporalDate.now(),
                            quantity: int.parse(stockNoController.text)))
                        .then((value) => Navigator.pop(context));
                  },
                  child: const Text('Add Inventory'),
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
