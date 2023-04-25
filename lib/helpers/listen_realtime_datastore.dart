import 'dart:async';

import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sistem/models/CategoryOfItems.dart';


//This Listens to Realtime changes to data in the datastore and changes the providers
StreamSubscription<QuerySnapshot<CategoryOfItems>>? stream; 

bool _isSynced = false; // Check if Data has been Synced( Move to a State Container )

class listenChanges extends ChangeNotifier {
  StreamSubscription<QuerySnapshot<CategoryOfItems>> stream = Amplify.DataStore.observeQuery(CategoryOfItems.classType,
  where: CategoryOfItems.ID.eq(CategoryOfItems())).listen(
    (QuerySnapshot<CategoryOfItems> snapshot){
      
    }
  );
}

void stopListeningChanges() {
  stream?.cancel();
}