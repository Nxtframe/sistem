import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sistem/helpers/sum.dart';
import 'package:sistem/providers/inventory_list_provider.dart';
import 'package:sistem/screens/single_inventory.dart';

class InventoryOnly extends ConsumerStatefulWidget {
  const InventoryOnly({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InventoryOnlyState();
}

class _InventoryOnlyState extends ConsumerState<InventoryOnly> {
  List<String> inventoryState = [];

  @override
  Widget build(BuildContext context) {
    final orgInventory = ref.watch(inventoryListProvider).value;
    setState(() {
      inventoryState.clear();
      for (var item in orgInventory!) {
        inventoryState.add(item.stock_name);
      }
    });

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => showSearch(
                context: context,
                delegate: ShowDelegate(searchTerms: inventoryState)),
          )
        ],
      ),
      body: SingleChildScrollView(
          child: SizedBox(
        height: 5000,
        child: Container(
            decoration: const BoxDecoration(color: Colors.white),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: inventoryState.length,
                  itemBuilder: (context, index) => ListTile(
                      trailing: const Icon(Icons.arrow_forward),
                      leading: const Icon(Icons.abc),
                      title: Text(inventoryState.elementAt(index)),
                      onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SingleInventory(
                                inventoryDateAndTime:
                                    orgInventory!.elementAt(index).updatedAt ??
                                        TemporalDateTime(
                                            DateTime.utc(2023, 4, 26, 12, 30)),
                                inventoryId: orgInventory.elementAt(index).id,
                                inventoryItemPrice:
                                    orgInventory.elementAt(index).stock_price ??
                                        0,
                                inventoryItemPriceTotal: sum(
                                    orgInventory.elementAt(index).stock_price ??
                                        0,
                                    double.parse(orgInventory
                                        .elementAt(index)
                                        .stock_no
                                        .toString())),
                                inventoryNo:
                                    orgInventory.elementAt(index).stock_no ?? 0,
                                itemCat: orgInventory
                                    .elementAt(index)
                                    .categoryofitemsID,
                                itemName:
                                    orgInventory.elementAt(index).stock_name,
                              ),
                            ),
                          ))),
            ])),
      )),
    );
  }
}

class ShowDelegate extends SearchDelegate {
  late List<String> searchTerms;

  ShowDelegate({required List<String> searchTerms}) {
    this.searchTerms = searchTerms;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear)),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in searchTerms) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
            onTap: () {
              Navigator.of(context).pop();
              Scrollable.ensureVisible(
                context,
                alignment: 0.5,
                duration: const Duration(milliseconds: 300),
              );
            },
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
            onTap: () {
              Navigator.of(context).pop();
              Scrollable.ensureVisible(
                context,
                alignment: 0.5,
                duration: const Duration(milliseconds: 300),
              );
            },
          );
        });
  }
}
