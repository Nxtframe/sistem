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
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Organization type in your schema. */
@immutable
class Organization extends Model {
  static const classType = const _OrganizationModelType();
  final String id;
  final String? _organization_name;
  final String? _organization_created;
  final List<Employee>? _employeetoorganisation;
  final List<Inventory>? _iventorytorelationship;
  final List<CategoryOfItems>? _category2organisation;
  final List<StockTransaction>? _StockTransactions;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

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
  
  List<Employee>? get employeetoorganisation {
    return _employeetoorganisation;
  }
  
  List<Inventory>? get iventorytorelationship {
    return _iventorytorelationship;
  }
  
  List<CategoryOfItems>? get category2organisation {
    return _category2organisation;
  }
  
  List<StockTransaction>? get StockTransactions {
    return _StockTransactions;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Organization._internal({required this.id, organization_name, organization_created, employeetoorganisation, iventorytorelationship, category2organisation, StockTransactions, createdAt, updatedAt}): _organization_name = organization_name, _organization_created = organization_created, _employeetoorganisation = employeetoorganisation, _iventorytorelationship = iventorytorelationship, _category2organisation = category2organisation, _StockTransactions = StockTransactions, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Organization({String? id, String? organization_name, String? organization_created, List<Employee>? employeetoorganisation, List<Inventory>? iventorytorelationship, List<CategoryOfItems>? category2organisation, List<StockTransaction>? StockTransactions}) {
    return Organization._internal(
      id: id == null ? UUID.getUUID() : id,
      organization_name: organization_name,
      organization_created: organization_created,
      employeetoorganisation: employeetoorganisation != null ? List<Employee>.unmodifiable(employeetoorganisation) : employeetoorganisation,
      iventorytorelationship: iventorytorelationship != null ? List<Inventory>.unmodifiable(iventorytorelationship) : iventorytorelationship,
      category2organisation: category2organisation != null ? List<CategoryOfItems>.unmodifiable(category2organisation) : category2organisation,
      StockTransactions: StockTransactions != null ? List<StockTransaction>.unmodifiable(StockTransactions) : StockTransactions);
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
      DeepCollectionEquality().equals(_employeetoorganisation, other._employeetoorganisation) &&
      DeepCollectionEquality().equals(_iventorytorelationship, other._iventorytorelationship) &&
      DeepCollectionEquality().equals(_category2organisation, other._category2organisation) &&
      DeepCollectionEquality().equals(_StockTransactions, other._StockTransactions);
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
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Organization copyWith({String? organization_name, String? organization_created, List<Employee>? employeetoorganisation, List<Inventory>? iventorytorelationship, List<CategoryOfItems>? category2organisation, List<StockTransaction>? StockTransactions}) {
    return Organization._internal(
      id: id,
      organization_name: organization_name ?? this.organization_name,
      organization_created: organization_created ?? this.organization_created,
      employeetoorganisation: employeetoorganisation ?? this.employeetoorganisation,
      iventorytorelationship: iventorytorelationship ?? this.iventorytorelationship,
      category2organisation: category2organisation ?? this.category2organisation,
      StockTransactions: StockTransactions ?? this.StockTransactions);
  }
  
  Organization.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _organization_name = json['organization_name'],
      _organization_created = json['organization_created'],
      _employeetoorganisation = json['employeetoorganisation'] is List
        ? (json['employeetoorganisation'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Employee.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _iventorytorelationship = json['iventorytorelationship'] is List
        ? (json['iventorytorelationship'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Inventory.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _category2organisation = json['category2organisation'] is List
        ? (json['category2organisation'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => CategoryOfItems.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _StockTransactions = json['StockTransactions'] is List
        ? (json['StockTransactions'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => StockTransaction.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'organization_name': _organization_name, 'organization_created': _organization_created, 'employeetoorganisation': _employeetoorganisation?.map((Employee? e) => e?.toJson()).toList(), 'iventorytorelationship': _iventorytorelationship?.map((Inventory? e) => e?.toJson()).toList(), 'category2organisation': _category2organisation?.map((CategoryOfItems? e) => e?.toJson()).toList(), 'StockTransactions': _StockTransactions?.map((StockTransaction? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'organization_name': _organization_name, 'organization_created': _organization_created, 'employeetoorganisation': _employeetoorganisation, 'iventorytorelationship': _iventorytorelationship, 'category2organisation': _category2organisation, 'StockTransactions': _StockTransactions, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<OrganizationModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<OrganizationModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField ORGANIZATION_NAME = QueryField(fieldName: "organization_name");
  static final QueryField ORGANIZATION_CREATED = QueryField(fieldName: "organization_created");
  static final QueryField EMPLOYEETOORGANISATION = QueryField(
    fieldName: "employeetoorganisation",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Employee'));
  static final QueryField IVENTORYTORELATIONSHIP = QueryField(
    fieldName: "iventorytorelationship",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Inventory'));
  static final QueryField CATEGORY2ORGANISATION = QueryField(
    fieldName: "category2organisation",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'CategoryOfItems'));
  static final QueryField STOCKTRANSACTIONS = QueryField(
    fieldName: "StockTransactions",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'StockTransaction'));
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
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Organization.EMPLOYEETOORGANISATION,
      isRequired: true,
      ofModelName: 'Employee',
      associatedKey: Employee.ORGANIZATIONIDTOEMPLOYEERELATION
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Organization.IVENTORYTORELATIONSHIP,
      isRequired: false,
      ofModelName: 'Inventory',
      associatedKey: Inventory.ORGANIZATIONID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Organization.CATEGORY2ORGANISATION,
      isRequired: false,
      ofModelName: 'CategoryOfItems',
      associatedKey: CategoryOfItems.ORGANIZATIONID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Organization.STOCKTRANSACTIONS,
      isRequired: false,
      ofModelName: 'StockTransaction',
      associatedKey: StockTransaction.ORGANIZATIONID
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