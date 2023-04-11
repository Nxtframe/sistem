import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//Single Inventory Requires an Item Description
class SingleInventory extends StatefulWidget {
  const SingleInventory(
      {super.key,
      this.itemCat = "Item Category Missing",
      required this.itemName,
      required this.inventoryId,
      required this.inventoryDateAndTime,
      required this.inventoryItemPrice,
      required this.inventoryItemPriceTotal});
  final String itemCat;
  final String itemName;
  final String inventoryId;
  final String inventoryDateAndTime;
  final int inventoryItemPrice;
  final int inventoryItemPriceTotal;
  @override
  State<SingleInventory> createState() => _SingleInventoryState();
}

class _SingleInventoryState extends State<SingleInventory> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          Image.network(
            "https://hatrabbits.com/wp-content/uploads/2017/01/tafel-1.jpg",
            height: height / 2,
          ),
          Row(
            children: [
              const Icon((FontAwesomeIcons.gamepad)),
              Text(widget.itemCat)
            ],
          ),
          Text(widget.itemName),
          Row(
            children: [
              SizedBox(
                child: Column(
                    children: [Text("Sorty Id"), Text(widget.inventoryId)]),
              ),
              SizedBox(
                child: Column(children: [
                  Text("Updated At"),
                  Text(widget.inventoryDateAndTime)
                ]),
              )
            ],
          ),
          Row(
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
                      onPressed: () => {},
                      icon: const Icon(FontAwesomeIcons.dumpster)),
                  const Text("Delete")
                ],
              )
            ],
          ),
          Flexible(
              child: Column(
            children: [
              Text("Quantity"),
              Row(
                children: const [Text("6"), Icon(FontAwesomeIcons.plus)],
              )
            ],
          )),
          Flexible(
              child: Column(
            children: [
              Text("Min Level"),
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
                  children: [Text("Price"), Text("$widget.inventoryItemPrice")],
                ),
                Column(children: [Text("Text Value"), Text("$widget.inventoryItemPriceTotal")],)
              ],
            ),
          )
        ],
      ),
    );
  }
}
