import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:sistem/models/ModelProvider.dart';


Future<String?> queryOrgansationName(String organisationId) async {
  try {
    final List<Organization> organisations = await Amplify.DataStore.query(Organization.classType,
    where: Organization.ID.eq(organisationId));
    if (organisations.isNotEmpty) {
      return organisations[0].organization_name;
    }
  } catch (e) {
    return null;
  }
  return null;
}