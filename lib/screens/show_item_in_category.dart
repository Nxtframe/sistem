import 'dart:async';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sistem/helpers/query_datastore.dart';
import 'package:sistem/models/ModelProvider.dart';
import 'package:sistem/screens/single_inventory.dart';

class ShowCategory extends ConsumerStatefulWidget {
  const ShowCategory(this.categoryName, this.categoryid, {super.key});
  final categoryid;
  final categoryName;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ShowCategoryState();
}

class _ShowCategoryState extends ConsumerState<ShowCategory> {
  List<InventoryListItem>? categoryItems;
  StreamSubscription<QuerySnapshot>? _subscription;

  @override
  void initState() {
    super.initState();
    _loadCategoryItems();
  }

  Future<void> _loadCategoryItems() async {
    _subscription = await observeModelwithRelation(Inventory, widget.categoryid,
        queryType: InventoryQueryType.byCategoryOfItems,
        function: _updateCategoryItems);
  }

  void _updateCategoryItems(QuerySnapshot<Model> snapshot) {
    final items = snapshot.items
        .whereType<Inventory>() // filter the only Inventory models
        .map((item) => InventoryListItem(
            id: item.id,
            stockName: item.stock_name,
            stockNo: item.stock_no ?? 0,
            stockSold: item.stock_sold ?? 0,
            stockPrice: item.stock_price ?? 0,
            stockSoldToday: item.stock_sold_today ?? 0,
            stockUpdatedAt: item.updatedAt ??
                TemporalDateTime(DateTime.utc(
                    2023, 4, 26, 12, 30)))) // extract all the props property
        .toList();

    setState(() {
      categoryItems = items;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _subscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    if (categoryItems == null) {
      // Show a loading indicator or something else
      return const Scaffold(body: CircularProgressIndicator());
    }
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: ListView.builder(
          itemCount: categoryItems?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            final item = categoryItems![index];
            return ListTile(
                title: Text(item.stockName),
                shape: const StadiumBorder(),
                tileColor: Colors.blue,
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SingleInventory(
                          itemCat: widget.categoryName,
                          itemName: item.stockName,
                          inventoryNo: item.stockNo,
                          inventoryId: item.id,
                          inventoryDateAndTime: item.stockUpdatedAt,
                          inventoryItemPrice: item.stockPrice,
                          inventoryItemPriceTotal:
                              item.stockPrice * item.stockNo),
                    )));
          },
        ),
      ),
    );
  }
}

class InventoryListItem {
  final String id;
  final String stockName;
  final int stockNo;
  final int stockSold;
  final int stockSoldToday;
  final double stockPrice;
  final TemporalDateTime stockUpdatedAt;

  InventoryListItem(
      {required this.id,
      required this.stockName,
      required this.stockNo,
      required this.stockSold,
      required this.stockSoldToday,
      required this.stockUpdatedAt,
      required this.stockPrice});
}
