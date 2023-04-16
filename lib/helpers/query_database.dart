import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:sistem/models/ModelProvider.dart';

Future<Object> queryDatabase(int organisationId) async {
  try {
    final organisationID = await Amplify.DataStore.query(Organization.classType,
    where: Organization.ID.eq(organisationId));
    return organisationID[0];
  } on DataStoreException catch (e) {
    return 'Query failed: $e';
  }
}