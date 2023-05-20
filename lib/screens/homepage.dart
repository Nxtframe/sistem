import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sistem/helpers/isRegisteredSP.dart';
import 'package:sistem/helpers/upload_picture.dart';
import 'package:sistem/providers/profile_info.dart';
import 'package:sistem/providers/total_stock_provider.dart';
import 'package:sistem/screens/ShowOrders/showOrders.dart';
import 'package:sistem/screens/add_category.dart';
import 'package:sistem/screens/add_inventory.dart';
import 'package:sistem/screens/all_category_folder.dart';
import 'package:sistem/screens/all_inventory.dart';
import 'package:sistem/screens/Orders/addOrder.dart';
import 'package:sistem/screens/signin_page.dart';
import 'package:sistem/screens/update_screen.dart';
import 'package:sistem/widgets/app_bar.dart';
import 'package:sistem/widgets/cards.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../providers/inventory_list_provider.dart';

//Refactor Everything into their Seperate Widgets

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final infoUser = ref.watch(userInfo).value ?? 'user';
    final userId =
        ref.watch(userInfoId).value ?? 'assets/profile/defaultimage.jpg';
    final avaliableItems = ref.watch(inventoryListProvider).value ?? [];
    final totalAvaliable = avaliableItems.length;
    final totalStock = ref.watch(totalStockProvider).value ?? [];
    final totalStockQuantity = totalStock.fold<int>(
        0, (total, transaction) => total + (transaction.quantity ?? 0));
    List<SalesData> dateQuantityList = totalStock
        .map((transaction) =>
            SalesData(transaction.date.toString(), transaction.quantity ?? 0))
        .toList();
    safePrint(dateQuantityList);
    return Scaffold(
      appBar: AppBarWidget(),
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment
                .spaceAround, //2 Rows for the 4 cards - First Row.
            children: [
              CardWidget(
                cardBgColor: 0xFF8A0AC5,
                businessMetric: "Total Unique Items",
                quantity: avaliableItems.length, //Take a List of ???? idk
              ),
              CardWidget(
                cardBgColor: 0xFF0015FF,
                businessMetric: "Stock Avaliable",
                quantity:
                    totalStockQuantity, //Take All the Inventory from provider
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Order Overview",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          ),
          SfCartesianChart(
              //Using LineSeries SFCartesian Chart for the Line chart.
              primaryXAxis: CategoryAxis(),
              // Chart title
              title: ChartTitle(text: 'Today Stock Added'),
              // Enable legend
              legend: Legend(isVisible: false),
              // Enable tooltip
              tooltipBehavior: _tooltipBehavior,
              series: <LineSeries>[
                LineSeries(
                    name: "Total Stock",
                    dataSource: dateQuantityList,
                    xValueMapper: (dynamic sales, int index) => sales.year,
                    yValueMapper: (dynamic sales, int index) => sales.sales,
                    // Enable data label
                    dataLabelSettings: const DataLabelSettings(isVisible: true))
              ])
        ]),
      ),
      endDrawer: SizedBox(
        // The Profile Drawer, right side drawer
        width: MediaQuery.of(context).size.width / 1.25,
        child: Drawer(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {});
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              const Text(
                'About',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 45,
              ),
              GestureDetector(
                onTap: () async => {
                  await Amplify.Auth.signOut(),
                  await Amplify.DataStore.clear(),
                  await isRegisteredSPDestroy(),
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInPage()))
                },
                child: const Text(
                  'Log Out',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              Material(
                borderRadius: BorderRadius.circular(500),
                child: InkWell(
                  borderRadius: BorderRadius.circular(500),
                  splashColor: Colors.black45,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.black,
                    child: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        //Left Side
        backgroundColor: const Color.fromARGB(255, 241, 239, 247),
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0x33EEF0F4),
              ),
              child: Column(children: [
                GestureDetector(
                  onTap: () => {uploadPicture(userId)},
                  child: SizedBox(
                    height: 80,
                    width: MediaQuery.of(context).size.width,
                    child: FutureBuilder<GetUrlResult>(
                      future: Amplify.Storage.getUrl(
                          key:
                              userId), // Replace "userId" with your AWS Amplify Storage key
                      builder: (BuildContext context,
                          AsyncSnapshot<GetUrlResult> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        }
                        if (snapshot.hasData) {
                          final imageUrl = snapshot.data!;
                          return CircleAvatar(
                            backgroundImage: NetworkImage(imageUrl.url),
                            child: imageUrl.url.isEmpty
                                ? const Icon(Icons.account_circle,
                                    size:
                                        80) // Placeholder icon if imageUrl is empty
                                : null,
                          );
                        } else if (snapshot.hasError) {
                          return const Icon(Icons.error);
                        } else {
                          return const Icon(Icons.account_circle,
                              size:
                                  80); // Placeholder icon if imageUrl is empty
                        }
                      },
                    ),
                  ),
                ),
                Text(infoUser),
              ]),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
              ),
              title: const Text('Dashboard'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.train,
              ),
              title: const Text('Show Category'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AllInventory()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.train,
              ),
              title: const Text('Show Inventory'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const InventoryOnly()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.account_circle,
              ),
              title: const Text('Add Category'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddCategory()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.account_circle,
              ),
              title: const Text('Add Inventory'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddInventory()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.account_circle,
              ),
              title: const Text('Update Inventory'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UpdateInventoryScreen()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.account_circle,
              ),
              title: const Text('Purchases'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddOrderWidget()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.account_circle,
              ),
              title: const Text('Purchase history'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ShowOrders()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.scale_sharp,
              ),
              title: const Text('Total Stock All Time( not done )'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.inbox,
              ),
              title: const Text('Invoices of the Items Bought (not done)'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SalesData {
  //List Type for datasource for LineSeries in SFCartesian Chart.
  final String year;
  final int sales;

  SalesData(this.year, this.sales);
}
