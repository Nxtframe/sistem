import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:sistem/models/ModelProvider.dart';
import 'package:sistem/widgets/app_bar_widget.dart';

class ShowUseOrdersWidget extends StatefulWidget {
  const ShowUseOrdersWidget({super.key});

  @override
  _ShowUseOrdersWidgetState createState() => _ShowUseOrdersWidgetState();
}

class _ShowUseOrdersWidgetState extends State<ShowUseOrdersWidget> {
  List<UseOrders> useOrders = [];

  @override
  void initState() {
    super.initState();
    fetchUseOrders();
  }

  void fetchUseOrders() async {
    try {
      // Fetch all UseOrders from the DataStore
      List<UseOrders> fetchedUseOrders =
          await Amplify.DataStore.query(UseOrders.classType);

      setState(() {
        useOrders = fetchedUseOrders;
      });
    } catch (e) {
      print('Error fetching UseOrders: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarFragment(),
      body: ListView.builder(
        itemCount: useOrders.length,
        itemBuilder: (context, index) {
          final useOrder = useOrders[index];
          return ListTile(
            textColor: Colors.blue,
            title: Text(useOrder.recipient ?? ''),
            subtitle: Text(useOrder.comments ?? ''),
            trailing: Text(useOrder.dategiven ?? ''),
          );
        },
      ),
    );
  }
}
