import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sistem/helpers/isRegisteredSP.dart';
import 'package:sistem/helpers/upload_picture.dart';
import 'package:sistem/providers/profile_info.dart';
import 'package:sistem/providers/total_stock_provider.dart';
import 'package:sistem/screens/About/about.dart';
import 'package:sistem/screens/Profile/profile_user.dart';
import 'package:sistem/screens/ShowOrders/showOrders.dart';
import 'package:sistem/screens/Team/team_employees.dart';
import 'package:sistem/screens/UseOrders/use_orders.dart';
import 'package:sistem/screens/add_category.dart';
import 'package:sistem/screens/add_inventory.dart';
import 'package:sistem/screens/all_category_folder.dart';
import 'package:sistem/screens/all_inventory.dart';
import 'package:sistem/screens/Orders/addOrder.dart';
import 'package:sistem/screens/signin_page.dart';
import 'package:sistem/screens/update_screen.dart';
import 'package:sistem/theme/app_theme.dart';
import 'package:sistem/widgets/appbar_home.dart';

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
    final appTheme = AppTheme();
    final infoUser = ref.watch(userInfo).value ?? 'user';
    final userId = ref.watch(userInfoId).value ?? 'assets/profile/default.png';
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
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const InventoryOnly())),
                child: CardWidget(
                  cardBgColor: 0xFF8A0AC5,
                  businessMetric: "Total Unique Items",
                  quantity: avaliableItems.length, //Take a List of ???? idk
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const InventoryOnly())),
                child: CardWidget(
                  cardBgColor: 0xFF0015FF,
                  businessMetric: "Stock Avaliable",
                  quantity:
                      totalStockQuantity, //Take All the Inventory from provider
                ),
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
            primaryXAxis: CategoryAxis(),
            series: <ChartSeries>[
              ColumnSeries<SalesData, String>(
                dataSource: dateQuantityList,
                xValueMapper: (SalesData sales, _) => sales.year,
                yValueMapper: (SalesData sales, _) => sales.sales,
              ),
            ],
          ),
        ]),
      ),
      endDrawer: SizedBox(
        // The Profile Drawer, right side drawer
        width: MediaQuery.of(context).size.width / 2,
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
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Profile()));
                  });
                },
                child: const Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AboutPage()));
                },
                child: const Text(
                  'About',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
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
                    fontSize: 20,
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
              decoration: BoxDecoration(
                color: Color(appTheme.backgroundColor),
              ),
              child: Column(children: [
                GestureDetector(
                  onTap: () async =>
                      {await uploadPicture(userId), ref.refresh(userInfoId)},
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
                          return const CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/default.png"),
                          );
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
                const SizedBox(height: 20),
                Text(infoUser, style: const TextStyle(color: Colors.white)),
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
                Icons.shuffle,
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
                Icons.amp_stories,
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
                Icons.perm_identity,
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
                Icons.vertical_distribute,
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
                Icons.signal_cellular_alt_rounded,
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
                Icons.shop_2_rounded,
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
              title: const Text('Manage team workers'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WorkersList()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.offline_bolt,
              ),
              title: const Text('Orders'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddUseOrderWidget()));
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
