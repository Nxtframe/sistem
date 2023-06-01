import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sistem/helpers/create_emp_and_organisation.dart';
import 'package:sistem/helpers/isRegisteredSP.dart';
import 'package:sistem/helpers/query_database_exists.dart';
import 'package:sistem/screens/homepage.dart';
import 'package:sistem/widgets/app_bar_widget.dart';
import '../widgets/error_screen.dart';

class InfoInput extends ConsumerStatefulWidget {
  const InfoInput({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InfoInputState();
}

class _InfoInputState extends ConsumerState<InfoInput> {
  String dropdownValue = 'Manager';

// Future<String?> _validateOrganisationId(String? value) async {
//   if (_validateEmptyString(value!) != null) {
//     // If the value is empty, return the existing validation error message.
//     return _validateEmptyString(value);
//   } else {
//     // Otherwise, try to parse the value as an integer and query the database.
//     final organisationId = value.toString();
//     try {
//       final result = await queryDatabase(organisationId);
//       // If queryDatabase returns an error, return a validation error message.
//       if (result is String) {
//         return 'Error querying database: $result';
//       }
//     } catch (e) {
//       // If an exception is thrown, return a validation error message.
//       return 'Error querying database: $e';
//     }
//   }
//   return null;
// }

  bool organisationNotFound = false;
  String? _validateEmptyString(String value) {
    if (value.isEmpty) {
      return 'This field cannot be empty';
    }
    return null;
  }

  String? _validateNumber(String value) {
    if (value.isEmpty && value.length < 10) {
      return 'Phone number should not be less than 10 digits';
    } else {
      try {
        int.parse(value);
      } catch (e) {
        return 'Input a Phone no';
      }
    }
    return null;
  }

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _organisation_Id_Controller =
      TextEditingController();
  final TextEditingController _employeePhone = TextEditingController();
  final TextEditingController _organisationName = TextEditingController();
  final TextEditingController _employeeName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarFragment(),
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () async => {
                            await Amplify.Auth.signOut(),
                            Navigator.pushReplacementNamed(context, '/')
                          },
                      child: const Text('Logout'))
                ],
              ),
            ),
            Form(
              key: _formKey,
              child: Column(children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Role: ', style: TextStyle(fontSize: 17)),
                    DropdownButton<String>(
                      value: dropdownValue,
                      alignment: const Alignment(0, 10),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: <String>['Manager', 'Employee']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                dropdownValue == 'Manager'
                    ? //If Manager Then he has to create an organisation
                    TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Organisation Name',
                        ),
                        controller: _organisationName,
                        validator: (value) => _validateEmptyString(value!))
                    : //Else Employee then he has to join a Organisation, OrganisationID Future me Fix this CAnt see
                    TextFormField(
                        controller: _organisation_Id_Controller,
                        validator: (value) => _validateEmptyString(value!),
                        decoration: const InputDecoration(
                          labelText: 'Organisation ID',
                        ),
                      ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Name',
                  ),
                  controller: _employeeName,
                  validator: (value) => _validateEmptyString(value!),
                ),
                TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Phone No',
                    ),
                    controller: _employeePhone,
                    validator: (value) => _validateNumber(value!)),
                ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // Form is valid, do something
                        if (dropdownValue == 'Manager') {
                          try {
                            final result = saveManager(
                                    'Manager',
                                    int.parse(_employeePhone.text),
                                    _organisationName.text)
                                .then((value) => {
                                      isRegisteredSP(), //THis Changes Prefs To isRegistered So that user wont have to go through registration again
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const HomePage())),
                                    });
                          } catch (e) {
                            print('queryDatabase failed with error: $e');
                          }
                        } else {
                          try {
                            if (await queryDatabase(
                                _organisation_Id_Controller.text)) {
                              final result = saveEmployee(
                                'Employee',
                                _organisation_Id_Controller.text,
                                int.parse(_employeePhone.text),
                              ).then(
                                (value) async => {
                                  await isRegisteredSP(),
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HomePage()))
                                },
                              );
                            } else {
                              // ignore: use_build_context_synchronously
                              showDialog(
                                context: context,
                                builder: (context) => const ErrorDialog(
                                    errorMessage: "Organisation ID not found"),
                              );
                            }
                          } catch (e) {
                            print('queryDatabase failed with error: $e');
                          }
                        }
                      }
                    },
                    child: const Text('Submit'))
              ]),
            )
          ],
        ),
      ),
    );
  }
}
