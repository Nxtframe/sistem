import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sistem/helpers/isRegisteredSP.dart';
import 'package:sistem/providers/profile_info.dart';
import 'package:sistem/screens/add_category.dart';
import 'package:sistem/screens/add_inventory.dart';
import 'package:sistem/screens/all_category_folder.dart';
import 'package:sistem/screens/all_inventory.dart';
import 'package:sistem/screens/signin_page.dart';
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
    final avaliableItems = ref.watch(inventoryListProvider).value ?? [];
    final totalAvaliable = avaliableItems.length;

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
              const CardWidget(
                cardBgColor: 0xFF8A0AC5,
                businessMetric: "Today Sales",
                quantity: 0, //Take a List of ???? idk
              ),
              CardWidget(
                cardBgColor: 0xFF0015FF,
                businessMetric: "Stock Avaliable",
                quantity: totalAvaliable, //Take All the Inventory from provider
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
              title: ChartTitle(text: 'Today Sales'),
              // Enable legend
              legend: Legend(isVisible: false),
              // Enable tooltip
              tooltipBehavior: _tooltipBehavior,
              series: <LineSeries<SalesData, String>>[
                LineSeries<SalesData, String>(
                    name: "Sales",
                    dataSource: [
                      SalesData('6 AM', 35),
                      SalesData('9 AM', 28),
                      SalesData('12 PM', 34),
                      SalesData('3 PM', 32),
                      SalesData('6 PM', 40)
                    ],
                    xValueMapper: (SalesData sales, _) => sales.year,
                    yValueMapper: (SalesData sales, _) => sales.sales,
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
                  child: SizedBox(
                    height: 80,
                    width: MediaQuery.of(context).size.width,
                    child: const CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://i.stack.imgur.com/x8PhM.png")),
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
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.scale_sharp,
              ),
              title: const Text('Total Sales(not done)'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.inbox,
              ),
              title: const Text('Invoices(not done)'),
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
  final double sales;

  SalesData(this.year, this.sales);
}
