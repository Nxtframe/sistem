import 'package:flutter/material.dart';
import 'package:sistem/screens/all_inventory_folder.dart';
import 'package:sistem/widgets/app_bar.dart';
import 'package:sistem/widgets/cards.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

//Refactor Everything into their Seperate Widgets

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true); 
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(), 
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround, //2 Rows for the 4 cards - First Row.
            children: const [
              CardWidget(
                cardBgColor: 0xFF8A0AC5,
                businessMetric: "Today Sales",
                quantity: 2442,
              ),
              CardWidget(
                businessMetric: "Pending Order",
                quantity: 55,
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround, //2 Rows for the 4 cards - Second Row.
              children: const [
                CardWidget(
                  cardBgColor: 0xFF0015FF,
                  businessMetric: "Stock Avaliable",
                  quantity: 43,
                ),
                CardWidget(
                  cardBgColor: 0xFFF50606,
                  businessMetric: "Today Orders",
                  quantity: 5,
                ),
              ]),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Order Overview",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          ),
          SfCartesianChart(                     //Using LineSeries SFCartesian Chart for the Line chart.
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
                    dataSource: <SalesData>[
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
      endDrawer: SizedBox(               // The Profile Drawer, right side drawer
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
              GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AllInventory())),
                child: const Text(
                  'Show Inventory',
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
              const Text(
                'Log Out',
                style: TextStyle(
                
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
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
        backgroundColor: Color.fromARGB(255, 241, 239, 247),
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
           DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0x33EEF0F4),
            ),
            child: Column(children: [ Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width,
                    child: CircleAvatar(backgroundImage: NetworkImage("https://i.stack.imgur.com/x8PhM.png")),
                    ), Text("Person Name"),Text("Email ID and Switch to Other Account")]),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
            ),
            title: const Text('Dashboard'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.train,
            ),
            title: const Text('Inventory'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.account_circle,
            ),
            title: const Text('Customers'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.scale_sharp,
            ),
            title: const Text('Sales'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.photo_camera_back_sharp,
            ),
            title: const Text('Packages'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.inbox,
            ),
            title: const Text('Invoices'),
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

class SalesData {   //List Type for datasource for LineSeries in SFCartesian Chart.
  final String year;
  final double sales;

  SalesData(this.year, this.sales);
}
