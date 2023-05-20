import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sistem/models/Employee.dart';

final employeeProvider = FutureProvider<Employee>((ref) async {
  // Your logic to fetch the employee data
  final employeeData =
      await fetchData(); // Replace with your own logic to fetch the employee data

  // Create and return the Employee object
  return employeeData;
});

// Example fetchData function
Future<Employee> fetchData() async {
  final user = await Amplify.Auth.getCurrentUser();

  // Replace with your own logic to fetch employee data from an API or database
  final List<Employee> employee = await Amplify.DataStore.query(
      Employee.classType,
      where: Employee.EMPLOYEE_EMAIL.eq(user.username.toLowerCase()));

  return employee.first;
}
