import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sistem/models/ModelProvider.dart';
import 'package:sistem/screens/update_screen.dart';

class SingleInventory extends StatefulWidget {
  const SingleInventory({
    Key? key,
    required this.itemCat,
    required this.itemName,
    required this.inventoryId,
    required this.inventoryNo,
    required this.inventoryDateAndTime,
    required this.inventoryItemPrice,
    required this.inventoryItemPriceTotal,
    required this.inventoryImage,
  }) : super(key: key);

  final String inventoryImage;
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
  Future<String> _getUrl(String key) async {
    final url = await Amplify.Storage.getUrl(key: key);
    return url.url;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: FutureBuilder<String>(
                    future: _getUrl(widget.inventoryImage),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Image.network(
                          snapshot.data!,
                          height: height / 4,
                        );
                      } else if (snapshot.hasError) {
                        return const Text('Error loading image');
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: width * 0.4,
                        child: Column(
                          children: [
                            Text(
                              'Item Name: ${widget.itemName}',
                              style: const TextStyle(fontSize: 20),
                            ),
                            const SizedBox(height: 20),
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
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Row(
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
                          final singleInventory1 =
                              await Amplify.DataStore.query(Inventory.classType,
                                  where: Inventory.ID.eq(widget.inventoryId));
                          if (singleInventory1.isNotEmpty) {
                            await Amplify.DataStore.delete<Inventory>(
                                    singleInventory1[0])
                                .then((value) => Navigator.pop(context));
                          }
                        },
                        icon: FontAwesomeIcons.dumpster,
                        text: 'Delete',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Inventory Avaliable:'),
                      const SizedBox(width: 10),
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
                ),
                Column(
                  children: [
                    const Text('Inventory Price:'),
                    const SizedBox(width: 10),
                    Text(widget.inventoryItemPrice.toString()),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Min Level"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                ),
                const SizedBox(height: 50),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Column(
                    children: [
                      const Text("Price"),
                      Text(
                        "${widget.inventoryItemPrice}",
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Column(
                    children: [
                      const Text("Text Value"),
                      Text(
                        "${widget.inventoryItemPriceTotal}",
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
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
