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

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Organization type in your schema. */
@immutable
class Organization extends Model {
  static const classType = const _OrganizationModelType();
  final String id;
  final String? _organization_name;
  final String? _organization_created;
  final Employee? _employee;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;
  final String? _organizationEmployeeId;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  OrganizationModelIdentifier get modelIdentifier {
      return OrganizationModelIdentifier(
        id: id
      );
  }
  
  String? get organization_name {
    return _organization_name;
  }
  
  String? get organization_created {
    return _organization_created;
  }
  
  Employee? get employee {
    return _employee;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  String? get organizationEmployeeId {
    return _organizationEmployeeId;
  }
  
  const Organization._internal({required this.id, organization_name, organization_created, employee, createdAt, updatedAt, organizationEmployeeId}): _organization_name = organization_name, _organization_created = organization_created, _employee = employee, _createdAt = createdAt, _updatedAt = updatedAt, _organizationEmployeeId = organizationEmployeeId;
  
  factory Organization({String? id, String? organization_name, String? organization_created, Employee? employee, String? organizationEmployeeId}) {
    return Organization._internal(
      id: id == null ? UUID.getUUID() : id,
      organization_name: organization_name,
      organization_created: organization_created,
      employee: employee,
      organizationEmployeeId: organizationEmployeeId);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Organization &&
      id == other.id &&
      _organization_name == other._organization_name &&
      _organization_created == other._organization_created &&
      _employee == other._employee &&
      _organizationEmployeeId == other._organizationEmployeeId;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Organization {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("organization_name=" + "$_organization_name" + ", ");
    buffer.write("organization_created=" + "$_organization_created" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null") + ", ");
    buffer.write("organizationEmployeeId=" + "$_organizationEmployeeId");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Organization copyWith({String? organization_name, String? organization_created, Employee? employee, String? organizationEmployeeId}) {
    return Organization._internal(
      id: id,
      organization_name: organization_name ?? this.organization_name,
      organization_created: organization_created ?? this.organization_created,
      employee: employee ?? this.employee,
      organizationEmployeeId: organizationEmployeeId ?? this.organizationEmployeeId);
  }
  
  Organization.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _organization_name = json['organization_name'],
      _organization_created = json['organization_created'],
      _employee = json['employee']?['serializedData'] != null
        ? Employee.fromJson(new Map<String, dynamic>.from(json['employee']['serializedData']))
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null,
      _organizationEmployeeId = json['organizationEmployeeId'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'organization_name': _organization_name, 'organization_created': _organization_created, 'employee': _employee?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format(), 'organizationEmployeeId': _organizationEmployeeId
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'organization_name': _organization_name, 'organization_created': _organization_created, 'employee': _employee, 'createdAt': _createdAt, 'updatedAt': _updatedAt, 'organizationEmployeeId': _organizationEmployeeId
  };

  static final QueryModelIdentifier<OrganizationModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<OrganizationModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField ORGANIZATION_NAME = QueryField(fieldName: "organization_name");
  static final QueryField ORGANIZATION_CREATED = QueryField(fieldName: "organization_created");
  static final QueryField EMPLOYEE = QueryField(
    fieldName: "employee",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Employee'));
  static final QueryField ORGANIZATIONEMPLOYEEID = QueryField(fieldName: "organizationEmployeeId");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Organization";
    modelSchemaDefinition.pluralName = "Organizations";
    
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
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Organization.ORGANIZATION_NAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Organization.ORGANIZATION_CREATED,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
      key: Organization.EMPLOYEE,
      isRequired: false,
      ofModelName: 'Employee',
      associatedKey: Employee.ID
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
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Organization.ORGANIZATIONEMPLOYEEID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _OrganizationModelType extends ModelType<Organization> {
  const _OrganizationModelType();
  
  @override
  Organization fromJson(Map<String, dynamic> jsonData) {
    return Organization.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Organization';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Organization] in your schema.
 */
@immutable
class OrganizationModelIdentifier implements ModelIdentifier<Organization> {
  final String id;

  /** Create an instance of OrganizationModelIdentifier using [id] the primary key. */
  const OrganizationModelIdentifier({
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
  String toString() => 'OrganizationModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is OrganizationModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}