import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:sistem/models/Employee.dart';
import 'package:sistem/models/ModelProvider.dart';
import 'package:uuid/uuid.dart';


Future _usersEmail() async {
    try {
      var attributes = (await Amplify.Auth.fetchUserAttributes()).toList();
      for (var attribute in attributes) {
        if (attribute.userAttributeKey.toString() == 'email') {
          return attribute.value.toString();
        }
      }
      return 'no email';
    } on AuthException catch (e) {
      return '${e.message}';
    }
  }


Future<void> saveEmployee(String employee_role,String organization_id, int employee_phone) async {
   final now = DateTime.now();
  final formattedDate = '${now.year}-${_addLeadingZero(now.month)}-${_addLeadingZero(now.day)}';
  
  final newEmployee = Employee(
    employee_created: formattedDate,
    employee_role: employee_role,
    id: UUID().toString(),
    organization_id: organization_id,
    employee_phone: employee_phone,
  );

  await Amplify.DataStore.save(newEmployee);
}

Future<void> saveManager(String employeeRole,String organizationId, int employeePhone,String organizationName,) async {
  final orgid = UUID().toString();
   final now = DateTime.now();
  final formattedDate = '${now.year}-${_addLeadingZero(now.month)}-${_addLeadingZero(now.day)}';
  
   final userEmail = await _usersEmail();

  final newManager = Employee(
    employee_created: formattedDate,
    employee_role: employeeRole,
    id: UUID().toString(),
    organization_id: orgid,
    employee_phone: employeePhone,
    employee_email: userEmail
  );

  final newOrganisation = Organization(
    id: orgid,
    organization_name: organizationName,
    organization_created: formattedDate,
  );
  
  try {
    await Amplify.DataStore.save(newManager);
    await Amplify.DataStore.save(newOrganisation);
  } catch (e) {
    Exception(e);
  }
  
  
}

String _addLeadingZero(int number) {
  return number.toString().padLeft(2, '0');
}