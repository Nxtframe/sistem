import 'dart:async';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sistem/models/CategoryOfItems.dart';
import 'package:sistem/providers/category_provider.dart';
import 'package:sistem/screens/items_folder.dart';

import '../models/Inventory.dart';
import '../providers/category_information.dart';

class AllInventory extends ConsumerStatefulWidget {
  const AllInventory({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AllInventoryState();
}

class _AllInventoryState extends ConsumerState<AllInventory> {
  List<Inventory> _itemFoldersList = [];
  bool _isSynced = false;
  //Query Database and get All Items with this folder name
  //Redundant code
  StreamSubscription<QuerySnapshot<Model>>? _stream;

  void observeQuery() {
    _stream = Amplify.DataStore.observeQuery(
      Inventory.classType,
      where: Inventory.CATEGORYOFITEMSID.eq(""),
      sortBy: List.empty(),
    ).listen((QuerySnapshot<Inventory> snapshot) {
      setState(() {
        _itemFoldersList = snapshot.items;
        _isSynced = snapshot.isSynced;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final noOfCategory = ref.watch(noOfCategoryProvider).value;
    final foldersList = ref.watch(categoryListProvider).value;
    Iterable<String> allCategory =
        foldersList?.map((items) => items.category_name ?? '') ?? [];

    safePrint(allCategory.length);

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                child: Column(
                  children: [
                    Text('No of Categories'),
                    Text(
                      noOfCategory.toString(),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  SizedBox(
                    child: Column(
                      children: [
                        Text('Total Value'),
                        Text(
                          noOfCategory.toString(),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
          Container(
            height: 500,
            child: ListView.builder(
                itemCount: allCategory.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(allCategory.elementAt(index)),
                  );
                }),
          )
        ],
      ),
    );
  }
}
