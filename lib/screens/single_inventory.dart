// import 'package:amplify_flutter/amplify_flutter.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:sistem/screens/update_screen.dart';
// import 'package:velocity_x/velocity_x.dart';

// import '../models/ModelProvider.dart';

// //Single Inventory Requires an Item Description
// class SingleInventory extends StatefulWidget {
//   const SingleInventory(
//       {super.key,
//       required this.itemCat,
//       required this.itemName,
//       required this.inventoryId,
//       required this.inventoryDateAndTime,
//       required this.inventoryItemPrice,
//       required this.inventoryItemPriceTotal,
//       required this.inventoryNo});
//   final String itemCat;
//   final String itemName;
//   final String inventoryId;
//   final int inventoryNo;
//   final TemporalDateTime inventoryDateAndTime;
//   final double inventoryItemPrice;
//   final double inventoryItemPriceTotal;
//   @override
//   State<SingleInventory> createState() => _SingleInventoryState();
// }

// class _SingleInventoryState extends State<SingleInventory> {
//   @override
//   Widget build(BuildContext context) {
//     Inventory itemToDelete;

//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;

//     return Scaffold(
//       appBar: AppBar(),
//       // bottomNavigationBar: BottomNavigationBar(items: const [
//       //   BottomNavigationBarItem(
//       //     icon: Icon(Icons.abc),
//       //   )
//       // ]),
//       body: SingleChildScrollView(
//         child: SizedBox(
//             height: 5000,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Image.network(
//                   "https://media.wired.com/photos/5fd28eff5310f0846594ca81/master/w_1920%2Cc_limit/Gear-Lenovo-Ideapad-Flex-5.jpg",
//                   height: height / 4,
//                 ),
//                 100.heightBox,
//                 const Text('Inventory ID:'),
//                 Row(
//                   children: [Text(widget.itemCat)],
//                 ),
//                 50.heightBox,
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     // SizedBox(
//                     //   child: Column(children: [
//                     //     const Text("Sorty Id"),
//                     //     Text(widget.inventoryId)
//                     //   ]),
//                     // ),
//                     SizedBox(
//                       child: Center(
//                         child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Text('Item Name:${widget.itemName}'),
//                               30.widthBox,
//                               const Text("Updated At"),
//                               Text(widget.inventoryDateAndTime
//                                   .toString()
//                                   .substring(0, 10))
//                             ]),
//                       ),
//                     )
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Column(
//                       children: [
//                         IconButton(
//                             onPressed: () => {},
//                             icon: const Icon(FontAwesomeIcons.moneyBillWave)),
//                         const Text("Move")
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         IconButton(
//                             onPressed: () => {},
//                             icon: const Icon(FontAwesomeIcons.backward)),
//                         const Text("History")
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         IconButton(
//                             onPressed: () => {},
//                             icon: const Icon(FontAwesomeIcons.fileExport)),
//                         const Text("Export")
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         IconButton(
//                             onPressed: () async {
//                               try {
//                                 final itemToDelete = // Refactor this
//                                     (await Amplify.DataStore.query(
//                                   Inventory.classType,
//                                   where: Inventory.ID.eq(widget.inventoryId),
//                                 ))
//                                         .first;
//                                 await Amplify.DataStore.delete(itemToDelete)
//                                     .then((value) => Navigator.pop(context));

//                                 // Handle successful deletion
//                               } catch (e) {
//                                 safePrint(
//                                     'Something went wrong deleting model: $e');
//                                 // Handle error
//                               }
//                             },
//                             icon: const Icon(FontAwesomeIcons.dumpster)),
//                         const Text("Delete")
//                       ],
//                     )
//                   ],
//                 ),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     const Text("Quantity"),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(widget.inventoryNo.toString()),
//                         IconButton(
//                           icon: const Icon(FontAwesomeIcons.plus),
//                           onPressed: () => Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) =>
//                                       const UpdateInventoryScreen())),
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     const Text("Min Level"),
//                     Row(
//                       children: [
//                         const Text("0"),
//                         IconButton(
//                           icon: const Icon(FontAwesomeIcons.bell),
//                           onPressed: () => {},
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//                 Container(
//                   child: Row(
//                     children: [
//                       Column(
//                         children: [
//                           const Text("Price"),
//                           Text("${widget.inventoryItemPrice}")
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           const Text("Text Value"),
//                           Text("${widget.inventoryItemPriceTotal}")
//                         ],
//                       )
//                     ],
//                   ),
//                 )
//               ],
//             )),
//       ),
//     );
//   }
// }

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sistem/screens/update_screen.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/ModelProvider.dart';

class SingleInventory extends StatefulWidget {
  const SingleInventory({
    super.key,
    required this.itemCat,
    required this.itemName,
    required this.inventoryId,
    required this.inventoryNo,
    required this.inventoryDateAndTime,
    required this.inventoryItemPrice,
    required this.inventoryItemPriceTotal,
  });

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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          height: height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                "https://media.wired.com/photos/5fd28eff5310f0846594ca81/master/w_1920%2Cc_limit/Gear-Lenovo-Ideapad-Flex-5.jpg",
                height: height / 4,
              ),
              const SizedBox(height: 100),
              const Text('Inventory ID:'),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.itemCat,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: width * 0.4,
                    child: Column(
                      children: [
                        Text(
                          'Item Name: ${widget.itemName}',
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(height: 30),
                        const Text("Updated At"),
                        Text(
                          widget.inventoryDateAndTime
                              .toString()
                              .substring(0, 10),
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildIconButton(
                    onPressed: () {},
                    icon: FontAwesomeIcons.moneyBillWave,
                    text: 'Move',
                  ),
                  _buildIconButton(
                    onPressed: () {},
                    icon: FontAwesomeIcons.backward,
                    text: 'History',
                  ),
                  _buildIconButton(
                    onPressed: () {},
                    icon: FontAwesomeIcons.fileExport,
                    text: 'Export',
                  ),
                  _buildIconButton(
                    onPressed: () async {
                      try {
                        final itemToDelete = (await Amplify.DataStore.query(
                          Inventory.classType,
                          where: Inventory.ID.eq(widget.inventoryId),
                        ))
                            .first;
                        await Amplify.DataStore.delete(itemToDelete);
                        Navigator.pop(context);
                        // Handle successful deletion
                      } catch (e) {
                        safePrint('Something went wrong deleting model: $e');
                        // Handle error
                      }
                    },
                    icon: FontAwesomeIcons.dumpster,
                    text: 'Delete',
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Quantity"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(widget.inventoryNo.toString()),
                      IconButton(
                        icon: const Icon(FontAwesomeIcons.plus),
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const UpdateInventoryScreen(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text("Min Level"),
                  Row(
                    children: [
                      const Text("0"),
                      IconButton(
                        icon: const Icon(FontAwesomeIcons.bell),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Column(
                children: [
                  const Text("Price"),
                  Text(
                    "${widget.inventoryItemPrice}",
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  const Text("Text Value"),
                  Text(
                    "${widget.inventoryItemPriceTotal}",
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton({
    required VoidCallback onPressed,
    required IconData icon,
    required String text,
  }) {
    return Column(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(icon),
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
