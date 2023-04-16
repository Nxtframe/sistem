import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sistem/providers/inventory_provider.dart';
import 'package:sistem/screens/items_folder.dart';

class AllInventory extends ConsumerStatefulWidget {
  const AllInventory({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AllInventoryState();
}

class _AllInventoryState extends ConsumerState<AllInventory> {

  
  @override
  Widget build(BuildContext context) {
    final noOfFolders = ref.watch(noOfFoldersProvider);
    List<String> foldersList = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];

    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [SizedBox( height: 100,),SizedBox(
              child: Column(children: [Text('Folders'), Text(noOfFolders.toString(),)],),
            ),
            Row(
            children: [SizedBox( height: 100,),SizedBox(
              child: Column(children: [Text('Items'), Text(noOfFolders.toString(),)],),
            )],
          ),
          Row(
            children: [SizedBox( height: 100,),SizedBox(
              child: Column(children: [Text('Total City'), Text(noOfFolders.toString(),)],),
            )],
          ),
          Row(
            children: [SizedBox( height: 100,),SizedBox(
              child: Column(children: [Text('Total Value'), Text(noOfFolders.toString(),)],),
            )],
          )],
          ),
          SizedBox(height: 50,),
          ListView.builder(
          itemCount: foldersList.length,
          itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(foldersList[index]),
            onTap: () => {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => ItemsFolder(foldersList[index]))))
            },
          );
        },
      ),

        ],
      ),
    );
  }
}