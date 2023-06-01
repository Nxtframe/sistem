import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sistem/models/CategoryOfItems.dart';
import 'package:sistem/providers/category_provider.dart';
import 'package:sistem/screens/show_item_in_category.dart';
import 'package:sistem/widgets/app_bar_widget.dart';

import '../providers/category_information.dart';

class AllInventory extends ConsumerStatefulWidget {
  const AllInventory({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AllInventoryState();
}

class _AllInventoryState extends ConsumerState<AllInventory> {
  // Query Database and get All Items with this folder name
  // Redundant code

  @override
  Widget build(BuildContext context) {
    final noOfCategory = ref.watch(noOfCategoryProvider).value;
    final foldersList = ref.watch(categoryListProvider).value;
    Iterable<String> allCategory =
        foldersList?.map((items) => items.category_name ?? '') ?? [];

    Iterable<String> allCategoryid =
        foldersList?.map((items) => items.id) ?? [];

    return Scaffold(
      appBar: AppBarFragment(
        title: 'Show Categories',
      ),
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
                    ),
                  ],
                ),
              ),
              Row(
                children: const [
                  SizedBox(
                    height: 100,
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 500,
            child: ListView.builder(
              itemCount: allCategory.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  child: ListTile(
                    title: Text(allCategory.elementAt(index)),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => ShowCategory(
                            allCategory.elementAt(index),
                            allCategoryid.elementAt(index))),
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () async {
                        final itemToDelete = (await Amplify.DataStore.query(
                          CategoryOfItems.classType,
                          where: CategoryOfItems.ID
                              .eq(allCategoryid.elementAt(index)),
                        ))
                            .first;
                        await Amplify.DataStore.delete(itemToDelete);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
