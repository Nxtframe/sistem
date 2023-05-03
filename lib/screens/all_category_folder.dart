import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sistem/providers/category_provider.dart';
import 'package:sistem/screens/show_item_in_category.dart';

import '../providers/category_information.dart';

class AllInventory extends ConsumerStatefulWidget {
  const AllInventory({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AllInventoryState();
}

class _AllInventoryState extends ConsumerState<AllInventory> {
  //Query Database and get All Items with this folder name
  //Redundant code

  @override
  Widget build(BuildContext context) {
    final noOfCategory = ref.watch(noOfCategoryProvider).value;
    final foldersList = ref.watch(categoryListProvider).value;
    Iterable<String> allCategory =
        foldersList?.map((items) => items.category_name ?? '') ?? [];

    Iterable<String> allCategoryid =
        foldersList?.map((items) => items.id) ?? [];

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
                    const Text('No of Categories'),
                    Text(
                      noOfCategory.toString(),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  SizedBox(
                    child: Column(
                      children: [
                        const Text('Total Value'),
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
          SizedBox(
            height: 500,
            child: ListView.builder(
                itemCount: allCategory.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      title: Text(allCategory.elementAt(index)),
                      onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => ShowCategory(
                                    allCategory.elementAt(index),
                                    allCategoryid.elementAt(index)))),
                          ));
                }),
          )
        ],
      ),
    );
  }
}
