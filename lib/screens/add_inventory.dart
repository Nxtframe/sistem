
import 'dart:async';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sistem/models/Inventory.dart';

class AddInventory extends ConsumerStatefulWidget {
  const AddInventory(this.categoryID, {super.key, required String itemFolder});

  final categoryID;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddInventoryState();
}

class _AddInventoryState extends ConsumerState<AddInventory> {

  List<Inventory> _itemFoldersList = [];
  bool _isSynced = false;
  //Query Database and get All Items with this folder name

  StreamSubscription<QuerySnapshot<Model>>? _stream;
  
  get categoryID => null;
  
  get stock_name => null;
  
  void observeQuery() {
    _stream = Amplify.DataStore.observeQuery(
      Inventory.classType,
      where: Inventory.CATEGORY_ID.eq(""),
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
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [SizedBox( height: 100,),SizedBox(
              child: Column(children: [Text('Folders'), Text("test")],),
            ),
            Row(
            children: [SizedBox( height: 100,),SizedBox(
              child: Column(children: [Text('Items'), Text("test")],),
            )],
          ),
          Row(
            children: [SizedBox( height: 100,),SizedBox(
              child: Column(children: [Text('Total City'), Text("test")],),
            )],
          ),
          Row(
            children: [SizedBox( height: 100,),SizedBox(
              child: Column(children: [Text('Total Value'), Text("test")],),
            )],
          )],
          ),
          const SizedBox(height: 50,),
          ListView.builder(
          itemCount: _itemFoldersList.length,
          itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(_itemFoldersList[index].toString()),
            onTap: () => {
              
            },
          );
        },
      ),

        ],
      ),
    );
  }
}