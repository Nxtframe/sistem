import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sistem/helpers/create_emp_and_organisation.dart';
import 'package:sistem/helpers/query_database.dart';

class InfoInput extends ConsumerStatefulWidget {
  const InfoInput({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InfoInputState();
}

class _InfoInputState extends ConsumerState<InfoInput> {
  String dropdownValue = 'Manager';

  String? _validateOrganisationId(String? value) {
    if (_validateEmptyString(value!) != null) {
      // If the value is empty, return the existing validation error message.
      return _validateEmptyString(value);
    } else {
      // Otherwise, try to parse the value as an integer and query the database.
      final organisationId = int.tryParse(value);
      if (organisationId == null) {
        return 'Organisation ID must be a number.';
      } else {
        // If the organisation ID is valid, call the queryDatabase method.
        try {
          queryDatabase(organisationId).then((result) {
            // If queryDatabase returns an error, return a validation error message.
            if (result is String) {
              return 'Error querying database: $result';
            }
          });
        } catch (e) {
          // If an exception is thrown, return a validation error message.
          return 'Error querying database: $e';
        }
      }
    }
  }

  
  bool organisationNotFound = false;
  String? _validateEmptyString(String value) {
    if (value.isEmpty) {
      return 'This field cannot be empty';
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
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(children: <Widget>[
              DropdownButton<String>(
                value: dropdownValue,
                alignment: Alignment(0, 10),
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
              dropdownValue == 'Manager'
                  ? //If Manager
                  TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Organisation Name',
                      ),
                      controller: _organisationName,
                      validator: (value) => _validateEmptyString(value!))
                  : //Else OrganisationID Future me Fix this CAnt see
                  TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _organisation_Id_Controller,
                      validator: (value) => _validateOrganisationId(value!),
                      decoration: InputDecoration(
                        labelText: 'Organisation ID',
                      ),
                    ),
              TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                  ),
                  controller: _employeeName,
                  validator: (value) => _validateEmptyString(value!)),
              TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Phone No',
                  ),
                  controller: _employeePhone,
                  validator: (value) => _validateEmptyString(value!)),
              ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // Form is valid, do something
                      if (dropdownValue == 'Manager') {
                        try {
                          final result = saveManager(
                            'Manager',
                            UUID().toString(),
                            int.parse(_employeePhone.text),
                            _organisationName.text
                          );
                        } catch (e) {
                          print('queryDatabase failed with error: $e');
                        }
                      }
                    }else{
                      try {
                          final result = saveEmployee(
                            'Employee',
                            _organisation_Id_Controller.text,
                             int.parse(_employeePhone.text),
                          );
                        } catch (e) {
                          print('queryDatabase failed with error: $e');
                        }
                    }
                  },
                  child: const Text('Submit'))
            ]),
          )
        ],
      ),
    );
  }
}
