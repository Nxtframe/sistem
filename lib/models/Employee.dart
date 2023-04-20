/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Employee type in your schema. */
@immutable
class Employee extends Model {
  static const classType = const _EmployeeModelType();
  final String id;
  final String? _employee_role;
  final String? _employee_organization;
  final String? _employee_email;
  final int? _employee_phone;
  final String? _employee_created;
  final String? _organizationIDtoEmployeeRelation;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  EmployeeModelIdentifier get modelIdentifier {
      return EmployeeModelIdentifier(
        id: id
      );
  }
  
  String? get employee_role {
    return _employee_role;
  }
  
  String? get employee_organization {
    return _employee_organization;
  }
  
  String? get employee_email {
    return _employee_email;
  }
  
  int? get employee_phone {
    return _employee_phone;
  }
  
  String? get employee_created {
    return _employee_created;
  }
  
  String? get organizationIDtoEmployeeRelation {
    return _organizationIDtoEmployeeRelation;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Employee._internal({required this.id, employee_role, employee_organization, employee_email, employee_phone, employee_created, organizationIDtoEmployeeRelation, createdAt, updatedAt}): _employee_role = employee_role, _employee_organization = employee_organization, _employee_email = employee_email, _employee_phone = employee_phone, _employee_created = employee_created, _organizationIDtoEmployeeRelation = organizationIDtoEmployeeRelation, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Employee({String? id, String? employee_role, String? employee_organization, String? employee_email, int? employee_phone, String? employee_created, String? organizationIDtoEmployeeRelation}) {
    return Employee._internal(
      id: id == null ? UUID.getUUID() : id,
      employee_role: employee_role,
      employee_organization: employee_organization,
      employee_email: employee_email,
      employee_phone: employee_phone,
      employee_created: employee_created,
      organizationIDtoEmployeeRelation: organizationIDtoEmployeeRelation);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Employee &&
      id == other.id &&
      _employee_role == other._employee_role &&
      _employee_organization == other._employee_organization &&
      _employee_email == other._employee_email &&
      _employee_phone == other._employee_phone &&
      _employee_created == other._employee_created &&
      _organizationIDtoEmployeeRelation == other._organizationIDtoEmployeeRelation;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Employee {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("employee_role=" + "$_employee_role" + ", ");
    buffer.write("employee_organization=" + "$_employee_organization" + ", ");
    buffer.write("employee_email=" + "$_employee_email" + ", ");
    buffer.write("employee_phone=" + (_employee_phone != null ? _employee_phone!.toString() : "null") + ", ");
    buffer.write("employee_created=" + "$_employee_created" + ", ");
    buffer.write("organizationIDtoEmployeeRelation=" + "$_organizationIDtoEmployeeRelation" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Employee copyWith({String? employee_role, String? employee_organization, String? employee_email, int? employee_phone, String? employee_created, String? organizationIDtoEmployeeRelation}) {
    return Employee._internal(
      id: id,
      employee_role: employee_role ?? this.employee_role,
      employee_organization: employee_organization ?? this.employee_organization,
      employee_email: employee_email ?? this.employee_email,
      employee_phone: employee_phone ?? this.employee_phone,
      employee_created: employee_created ?? this.employee_created,
      organizationIDtoEmployeeRelation: organizationIDtoEmployeeRelation ?? this.organizationIDtoEmployeeRelation);
  }
  
  Employee.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _employee_role = json['employee_role'],
      _employee_organization = json['employee_organization'],
      _employee_email = json['employee_email'],
      _employee_phone = (json['employee_phone'] as num?)?.toInt(),
      _employee_created = json['employee_created'],
      _organizationIDtoEmployeeRelation = json['organizationIDtoEmployeeRelation'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'employee_role': _employee_role, 'employee_organization': _employee_organization, 'employee_email': _employee_email, 'employee_phone': _employee_phone, 'employee_created': _employee_created, 'organizationIDtoEmployeeRelation': _organizationIDtoEmployeeRelation, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'employee_role': _employee_role, 'employee_organization': _employee_organization, 'employee_email': _employee_email, 'employee_phone': _employee_phone, 'employee_created': _employee_created, 'organizationIDtoEmployeeRelation': _organizationIDtoEmployeeRelation, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<EmployeeModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<EmployeeModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField EMPLOYEE_ROLE = QueryField(fieldName: "employee_role");
  static final QueryField EMPLOYEE_ORGANIZATION = QueryField(fieldName: "employee_organization");
  static final QueryField EMPLOYEE_EMAIL = QueryField(fieldName: "employee_email");
  static final QueryField EMPLOYEE_PHONE = QueryField(fieldName: "employee_phone");
  static final QueryField EMPLOYEE_CREATED = QueryField(fieldName: "employee_created");
  static final QueryField ORGANIZATIONIDTOEMPLOYEERELATION = QueryField(fieldName: "organizationIDtoEmployeeRelation");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Employee";
    modelSchemaDefinition.pluralName = "Employees";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ]),
      AuthRule(
        authStrategy: AuthStrategy.PRIVATE,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.indexes = [
      ModelIndex(fields: const ["organizationIDtoEmployeeRelation"], name: "byOrganization")
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Employee.EMPLOYEE_ROLE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Employee.EMPLOYEE_ORGANIZATION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Employee.EMPLOYEE_EMAIL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Employee.EMPLOYEE_PHONE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Employee.EMPLOYEE_CREATED,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Employee.ORGANIZATIONIDTOEMPLOYEERELATION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _EmployeeModelType extends ModelType<Employee> {
  const _EmployeeModelType();
  
  @override
  Employee fromJson(Map<String, dynamic> jsonData) {
    return Employee.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Employee';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Employee] in your schema.
 */
@immutable
class EmployeeModelIdentifier implements ModelIdentifier<Employee> {
  final String id;

  /** Create an instance of EmployeeModelIdentifier using [id] the primary key. */
  const EmployeeModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'EmployeeModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is EmployeeModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}