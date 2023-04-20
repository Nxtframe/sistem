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