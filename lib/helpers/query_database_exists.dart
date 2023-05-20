import 'dart:async';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:sistem/models/ModelProvider.dart';

Future<bool> queryDatabase(String organisationId) async {
  try {
    final organisationID = await Amplify.DataStore.query(Organization.classType,
        where: Organization.ID.eq(organisationId));
    return organisationID.isNotEmpty;
  } catch (e) {
    return false;
  }
}

Future<bool> queryDatabaseforEmail(String emailid) async {
  final completer = Completer<bool>();
  late StreamSubscription subscription;
  subscription = Amplify.DataStore.observeQuery(Employee.classType,
          where: Employee.EMPLOYEE_EMAIL.eq(emailid))
      .listen((_) {
    subscription.cancel();
    completer.complete(true);
  }, onError: (e) {
    completer.completeError(e);
  }, cancelOnError: true);
  try {
    return await completer.future.timeout(const Duration(seconds: 10));
  } catch (_) {
    return false;
  }
}
