import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sistem/helpers/query_orgId_from_email.dart';
import 'package:sistem/models/Employee.dart';

final employeeProvider = FutureProvider<Employee>((ref) async {
  // Your logic to fetch the employee data
  final employeeData = await fetchData();
  // Create and return the Employee object
  return employeeData;
});

// Example fetchData function
Future<Employee> fetchData() async {
  final user = await Amplify.Auth.getCurrentUser();
  safePrint(user.username);
  // Replace with your own logic to fetch employee data from an API or database
  final List<Employee> employee = await Amplify.DataStore.query(
      Employee.classType,
      where: Employee.EMPLOYEE_EMAIL.eq(user.username.toLowerCase()));

  return employee.first;
}

final employeeListProvider = FutureProvider<List<Employee>>((ref) async {
  // Your logic to fetch the list of employees
  final orgid = await queryOrgansationIdFromEmail();
  safePrint(orgid);
  final employees = await Amplify.DataStore.query(Employee.classType,
      where: Employee.ORGANIZATIONIDTOEMPLOYEERELATION.eq(orgid));
  return employees;
});
