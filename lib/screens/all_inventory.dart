import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sistem/helpers/sum.dart';
import 'package:sistem/providers/inventory_list_provider.dart';
import 'package:sistem/screens/single_inventory.dart';
import 'package:sistem/theme/app_theme.dart';

class InventoryOnly extends ConsumerStatefulWidget {
  const InventoryOnly({Key? key}) : super(key: key);

  @override
  _InventoryOnlyState createState() => _InventoryOnlyState();
}

class _InventoryOnlyState extends ConsumerState<InventoryOnly> {
  Future<String> _getUrl(String key) async {
    final url = await Amplify.Storage.getUrl(key: key);
    return url.url;
  }

  @override
  Widget build(BuildContext context) {
    final orgInventory = ref.watch(inventoryListProvider).value;
    List<String> inventoryState =
        orgInventory?.map((item) => item.stock_name).toList() ?? [];

    return Scaffold(
      appBar: AppBar(
        title: const Text('All Inventory'),
        backgroundColor: Color(AppTheme()
            .backgroundColor), // Apply the captivating blue color to the app bar
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => showSearch(
              context: context,
              delegate: ShowDelegate(searchTerms: inventoryState),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
                10), // Add a subtle rounded corner to the container
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(
                    0.2), // Apply a soft shadow effect to the container
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: inventoryState.length,
                itemBuilder: (context, index) {
                  final inventoryItem = orgInventory![index];
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal:
                            16), // Increase the content padding for a larger ListTile
                    leading: Container(
                      width: 48,
                      height: 48,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: ClipOval(
                        child: FutureBuilder<String>(
                          future: _getUrl(inventoryItem.stock_image!.first),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            }
                            if (snapshot.hasError) {
                              return Image.asset(
                                'assets/images/default.png',
                                fit: BoxFit.cover,
                              );
                            }
                            return FadeInImage.assetNetwork(
                              placeholder: 'assets/images/default.png',
                              image: snapshot.data!,
                              fit: BoxFit.cover,
                              fadeInDuration: const Duration(milliseconds: 300),
                              fadeOutDuration:
                                  const Duration(milliseconds: 100),
                              imageErrorBuilder: (context, error, stackTrace) =>
                                  Image.asset(
                                'assets/images/default.png',
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    title: Text(
                      inventoryItem.stock_name,
                      style: const TextStyle(color: Colors.black),
                    ),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SingleInventory(
                          inventoryDateAndTime: inventoryItem.updatedAt ??
                              TemporalDateTime(
                                  DateTime.utc(2023, 4, 26, 12, 30)),
                          inventoryId: inventoryItem.id,
                          inventoryItemPrice: inventoryItem.stock_price ?? 0,
                          inventoryItemPriceTotal: sum(
                            inventoryItem.stock_price ?? 0,
                            double.parse(inventoryItem.stock_no.toString()),
                          ),
                          inventoryNo: inventoryItem.stock_no ?? 0,
                          itemCat: inventoryItem.categoryofitemsID,
                          itemName: inventoryItem.stock_name,
                          inventoryImage: inventoryItem.stock_image?.first ??
                              'https://upload.wikimedia.org/wikipedia/en/a/a9/Example.jpg',
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShowDelegate extends SearchDelegate<String> {
  final List<String> searchTerms;

  ShowDelegate({required this.searchTerms});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, query);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final matchQuery = searchTerms
        .where((term) => term.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        final result = matchQuery[index];
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
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final matchQuery = searchTerms
        .where((term) => term.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        final result = matchQuery[index];
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
      },
    );
  }
}
