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


/** This is an auto generated class representing the Inventory type in your schema. */
@immutable
class Inventory extends Model {
  static const classType = const _InventoryModelType();
  final String id;
  final String? _stock_name;
  final String? _stock_added;
  final String? _stock_organization;
  final int? _stock_no;
  final String? _stock_sold;
  final String? _stock_sold_today;
  final String? _stock_last_added;
  final String? _stock_created;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  InventoryModelIdentifier get modelIdentifier {
      return InventoryModelIdentifier(
        id: id
      );
  }
  
  String get stock_name {
    try {
      return _stock_name!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get stock_added {
    return _stock_added;
  }
  
  String? get stock_organization {
    return _stock_organization;
  }
  
  int? get stock_no {
    return _stock_no;
  }
  
  String? get stock_sold {
    return _stock_sold;
  }
  
  String? get stock_sold_today {
    return _stock_sold_today;
  }
  
  String? get stock_last_added {
    return _stock_last_added;
  }
  
  String? get stock_created {
    return _stock_created;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Inventory._internal({required this.id, required stock_name, stock_added, stock_organization, stock_no, stock_sold, stock_sold_today, stock_last_added, stock_created, createdAt, updatedAt}): _stock_name = stock_name, _stock_added = stock_added, _stock_organization = stock_organization, _stock_no = stock_no, _stock_sold = stock_sold, _stock_sold_today = stock_sold_today, _stock_last_added = stock_last_added, _stock_created = stock_created, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Inventory({String? id, required String stock_name, String? stock_added, String? stock_organization, int? stock_no, String? stock_sold, String? stock_sold_today, String? stock_last_added, String? stock_created}) {
    return Inventory._internal(
      id: id == null ? UUID.getUUID() : id,
      stock_name: stock_name,
      stock_added: stock_added,
      stock_organization: stock_organization,
      stock_no: stock_no,
      stock_sold: stock_sold,
      stock_sold_today: stock_sold_today,
      stock_last_added: stock_last_added,
      stock_created: stock_created);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Inventory &&
      id == other.id &&
      _stock_name == other._stock_name &&
      _stock_added == other._stock_added &&
      _stock_organization == other._stock_organization &&
      _stock_no == other._stock_no &&
      _stock_sold == other._stock_sold &&
      _stock_sold_today == other._stock_sold_today &&
      _stock_last_added == other._stock_last_added &&
      _stock_created == other._stock_created;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Inventory {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("stock_name=" + "$_stock_name" + ", ");
    buffer.write("stock_added=" + "$_stock_added" + ", ");
    buffer.write("stock_organization=" + "$_stock_organization" + ", ");
    buffer.write("stock_no=" + (_stock_no != null ? _stock_no!.toString() : "null") + ", ");
    buffer.write("stock_sold=" + "$_stock_sold" + ", ");
    buffer.write("stock_sold_today=" + "$_stock_sold_today" + ", ");
    buffer.write("stock_last_added=" + "$_stock_last_added" + ", ");
    buffer.write("stock_created=" + "$_stock_created" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Inventory copyWith({String? stock_name, String? stock_added, String? stock_organization, int? stock_no, String? stock_sold, String? stock_sold_today, String? stock_last_added, String? stock_created}) {
    return Inventory._internal(
      id: id,
      stock_name: stock_name ?? this.stock_name,
      stock_added: stock_added ?? this.stock_added,
      stock_organization: stock_organization ?? this.stock_organization,
      stock_no: stock_no ?? this.stock_no,
      stock_sold: stock_sold ?? this.stock_sold,
      stock_sold_today: stock_sold_today ?? this.stock_sold_today,
      stock_last_added: stock_last_added ?? this.stock_last_added,
      stock_created: stock_created ?? this.stock_created);
  }
  
  Inventory.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _stock_name = json['stock_name'],
      _stock_added = json['stock_added'],
      _stock_organization = json['stock_organization'],
      _stock_no = (json['stock_no'] as num?)?.toInt(),
      _stock_sold = json['stock_sold'],
      _stock_sold_today = json['stock_sold_today'],
      _stock_last_added = json['stock_last_added'],
      _stock_created = json['stock_created'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'stock_name': _stock_name, 'stock_added': _stock_added, 'stock_organization': _stock_organization, 'stock_no': _stock_no, 'stock_sold': _stock_sold, 'stock_sold_today': _stock_sold_today, 'stock_last_added': _stock_last_added, 'stock_created': _stock_created, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'stock_name': _stock_name, 'stock_added': _stock_added, 'stock_organization': _stock_organization, 'stock_no': _stock_no, 'stock_sold': _stock_sold, 'stock_sold_today': _stock_sold_today, 'stock_last_added': _stock_last_added, 'stock_created': _stock_created, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<InventoryModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<InventoryModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField STOCK_NAME = QueryField(fieldName: "stock_name");
  static final QueryField STOCK_ADDED = QueryField(fieldName: "stock_added");
  static final QueryField STOCK_ORGANIZATION = QueryField(fieldName: "stock_organization");
  static final QueryField STOCK_NO = QueryField(fieldName: "stock_no");
  static final QueryField STOCK_SOLD = QueryField(fieldName: "stock_sold");
  static final QueryField STOCK_SOLD_TODAY = QueryField(fieldName: "stock_sold_today");
  static final QueryField STOCK_LAST_ADDED = QueryField(fieldName: "stock_last_added");
  static final QueryField STOCK_CREATED = QueryField(fieldName: "stock_created");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Inventory";
    modelSchemaDefinition.pluralName = "Inventories";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Inventory.STOCK_NAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Inventory.STOCK_ADDED,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Inventory.STOCK_ORGANIZATION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Inventory.STOCK_NO,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Inventory.STOCK_SOLD,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Inventory.STOCK_SOLD_TODAY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Inventory.STOCK_LAST_ADDED,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Inventory.STOCK_CREATED,
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

class _InventoryModelType extends ModelType<Inventory> {
  const _InventoryModelType();
  
  @override
  Inventory fromJson(Map<String, dynamic> jsonData) {
    return Inventory.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Inventory';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Inventory] in your schema.
 */
@immutable
class InventoryModelIdentifier implements ModelIdentifier<Inventory> {
  final String id;

  /** Create an instance of InventoryModelIdentifier using [id] the primary key. */
  const InventoryModelIdentifier({
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
  String toString() => 'InventoryModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is InventoryModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}