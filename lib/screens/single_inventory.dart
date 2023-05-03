import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/ModelProvider.dart';

//Single Inventory Requires an Item Description
class SingleInventory extends StatefulWidget {
  const SingleInventory(
      {super.key,
      required this.itemCat,
      required this.itemName,
      required this.inventoryId,
      required this.inventoryDateAndTime,
      required this.inventoryItemPrice,
      required this.inventoryItemPriceTotal,
      required this.inventoryNo});
  final String itemCat;
  final String itemName;
  final String inventoryId;
  final int inventoryNo;
  final TemporalDateTime inventoryDateAndTime;
  final double inventoryItemPrice;
  final double inventoryItemPriceTotal;
  @override
  State<SingleInventory> createState() => _SingleInventoryState();
}

class _SingleInventoryState extends State<SingleInventory> {
  @override
  Widget build(BuildContext context) {
    Inventory itemToDelete;

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(),
      // bottomNavigationBar: BottomNavigationBar(items: const [
      //   BottomNavigationBarItem(
      //     icon: Icon(Icons.abc),
      //   )
      // ]),
      body: SingleChildScrollView(
        child: SizedBox(
            height: 5000,
            child: Column(
              children: [
                // Image.network(
                //   "https://hatrabbits.com/wp-content/uploads/2017/01/tafel-1.jpg",
                //   height: height / 2,
                // ),
                Row(
                  children: [Text(widget.itemCat)],
                ),
                Text(widget.itemName),
                Row(
                  children: [
                    // SizedBox(
                    //   child: Column(children: [
                    //     const Text("Sorty Id"),
                    //     Text(widget.inventoryId)
                    //   ]),
                    // ),
                    SizedBox(
                      child: Column(children: [
                        const Text("Updated At"),
                        Text(widget.inventoryDateAndTime.toString())
                      ]),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        IconButton(
                            onPressed: () => {},
                            icon: const Icon(FontAwesomeIcons.moneyBillWave)),
                        const Text("Move")
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () => {},
                            icon: const Icon(FontAwesomeIcons.backward)),
                        const Text("History")
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () => {},
                            icon: const Icon(FontAwesomeIcons.fileExport)),
                        const Text("Export")
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () async {
                              try {
                                final itemToDelete = // Refactor this
                                    (await Amplify.DataStore.query(
                                  Inventory.classType,
                                  where: Inventory.ID.eq(widget.inventoryId),
                                ))
                                        .first;
                                await Amplify.DataStore.delete(itemToDelete)
                                    .then((value) => Navigator.pop(context));

                                // Handle successful deletion
                              } catch (e) {
                                safePrint(
                                    'Something went wrong deleting model: $e');
                                // Handle error
                              }
                            },
                            icon: const Icon(FontAwesomeIcons.dumpster)),
                        const Text("Delete")
                      ],
                    )
                  ],
                ),
                Flexible(
                    child: Column(
                  children: [
                    const Text("Quantity"),
                    Row(
                      children: [
                        Text(widget.itemCat),
                        const Icon(FontAwesomeIcons.plus)
                      ],
                    )
                  ],
                )),
                Flexible(
                    child: Column(
                  children: [
                    const Text("Min Level"),
                    Row(
                      children: [
                        const Text("0"),
                        IconButton(
                          icon: const Icon(FontAwesomeIcons.bell),
                          onPressed: () => {},
                        )
                      ],
                    )
                  ],
                )),
                Flexible(
                  child: Row(
                    children: [
                      Column(
                        children: [
                          const Text("Price"),
                          Text("${widget.inventoryItemPrice}")
                        ],
                      ),
                      Column(
                        children: [
                          const Text("Text Value"),
                          Text("${widget.inventoryItemPriceTotal}")
                        ],
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
