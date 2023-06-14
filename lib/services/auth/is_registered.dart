import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sistem/screens/homepage.dart';
import 'package:sistem/screens/info_input_screen.dart';

import '../../helpers/query_database_exists.dart';
import '../../helpers/userData.dart';
import '../../theme/theme_constants.dart';

// To Refactor Prio - 1
//Use SharedPreferences MOFO
//Tip 3 Do everything avaliable on the earth frfr to finish this and make it work
//Dont make this to sell
class IsRegistered extends ConsumerStatefulWidget {
  const IsRegistered({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _IsRegisteredState();
}

class _IsRegisteredState extends ConsumerState<IsRegistered> {
  Future<bool> _getisRegisteredBoolSP() async {
    //DId user fill form
    // Stored in Shared Preps if not there then user is false
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? boolValue = prefs.getBool('isRegistered');
    if (boolValue == null) {
      return false;
    }
    return boolValue;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _getisRegisteredBoolSP(), // IIFE code , Very convoluted I know
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(color: Colors.blue),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          if (snapshot.data == true) {
            // User is registered to Database
            return const Scaffold(body: HomePage());
          } else {
            // User is not registered to Database
            return const Scaffold(body: InfoInput());
          }
        }
      },
    );
  }
}
