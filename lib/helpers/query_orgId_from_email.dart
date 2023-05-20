import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:sistem/models/ModelProvider.dart';

Future<String?> queryOrgansationIdFromEmail() async {
  // (P5) High Priority Dosent work half the damn time returns No ORganisation which is false ,Which is what it says false
  try {
    final user = await Amplify.Auth.getCurrentUser();

    final List<Employee> organisations = await Amplify.DataStore.query(
        Employee.classType,
        where: Employee.EMPLOYEE_EMAIL.eq(user.username.toLowerCase()));
    if (organisations.isNotEmpty) {
      return organisations[0].organizationIDtoEmployeeRelation;
    } else {
      throw Error();
    }
  } catch (e) {
    return 'Catch this';
  }
}
