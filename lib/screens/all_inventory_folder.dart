import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sistem/providers/category_provider.dart';
import 'package:sistem/screens/items_folder.dart';

class AllInventory extends ConsumerStatefulWidget {
  const AllInventory({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AllInventoryState();
}

class _AllInventoryState extends ConsumerState<AllInventory> {

  
  @override
  Widget build(BuildContext context) {
    final noOfCategory = ref.watch(noOfCategoryProvider);
    List<String> foldersList = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];

    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [SizedBox( height: 100,),SizedBox(
              child: Column(children: [Text('Folders'), Text(noOfCategory.toString(),)],),
            ),
            Row(
            children: [SizedBox( height: 100,),SizedBox(
              child: Column(children: [Text('Items'), Text(noOfCategory.toString(),)],),
            )],
          ),
          Row(
            children: [SizedBox( height: 100,),SizedBox(
              child: Column(children: [Text('Total City'), Text(noOfCategory.toString(),)],),
            )],
          ),
          Row(
            children: [SizedBox( height: 100,),SizedBox(
              child: Column(children: [Text('Total Value'), Text(noOfCategory.toString(),)],),
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