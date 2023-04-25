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


/** This is an auto generated class representing the Inventory type in your schema. */
@immutable
class Inventory extends Model {
  static const classType = const _InventoryModelType();
  final String id;
  final String? _stock_name;
  final String? _stock_organization_id;
  final int? _stock_no;
  final int? _stock_sold;
  final int? _stock_sold_today;
  final TemporalDate? _stock_last_added;
  final String? _stock_created;
  final String? _stock_category;
  final Organization? _organization2Inventory;
  final String? _categoryofitemsID;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;
  final String? _inventoryOrganization2InventoryId;

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
  
  String? get stock_organization_id {
    return _stock_organization_id;
  }
  
  int? get stock_no {
    return _stock_no;
  }
  
  int? get stock_sold {
    return _stock_sold;
  }
  
  int? get stock_sold_today {
    return _stock_sold_today;
  }
  
  TemporalDate? get stock_last_added {
    return _stock_last_added;
  }
  
  String? get stock_created {
    return _stock_created;
  }
  
  String? get stock_category {
    return _stock_category;
  }
  
  Organization? get organization2Inventory {
    return _organization2Inventory;
  }
  
  String get categoryofitemsID {
    try {
      return _categoryofitemsID!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  String? get inventoryOrganization2InventoryId {
    return _inventoryOrganization2InventoryId;
  }
  
  const Inventory._internal({required this.id, required stock_name, stock_organization_id, stock_no, stock_sold, stock_sold_today, stock_last_added, stock_created, stock_category, organization2Inventory, required categoryofitemsID, createdAt, updatedAt, inventoryOrganization2InventoryId}): _stock_name = stock_name, _stock_organization_id = stock_organization_id, _stock_no = stock_no, _stock_sold = stock_sold, _stock_sold_today = stock_sold_today, _stock_last_added = stock_last_added, _stock_created = stock_created, _stock_category = stock_category, _organization2Inventory = organization2Inventory, _categoryofitemsID = categoryofitemsID, _createdAt = createdAt, _updatedAt = updatedAt, _inventoryOrganization2InventoryId = inventoryOrganization2InventoryId;
  
  factory Inventory({String? id, required String stock_name, String? stock_organization_id, int? stock_no, int? stock_sold, int? stock_sold_today, TemporalDate? stock_last_added, String? stock_created, String? stock_category, Organization? organization2Inventory, required String categoryofitemsID, String? inventoryOrganization2InventoryId}) {
    return Inventory._internal(
      id: id == null ? UUID.getUUID() : id,
      stock_name: stock_name,
      stock_organization_id: stock_organization_id,
      stock_no: stock_no,
      stock_sold: stock_sold,
      stock_sold_today: stock_sold_today,
      stock_last_added: stock_last_added,
      stock_created: stock_created,
      stock_category: stock_category,
      organization2Inventory: organization2Inventory,
      categoryofitemsID: categoryofitemsID,
      inventoryOrganization2InventoryId: inventoryOrganization2InventoryId);
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
      _stock_organization_id == other._stock_organization_id &&
      _stock_no == other._stock_no &&
      _stock_sold == other._stock_sold &&
      _stock_sold_today == other._stock_sold_today &&
      _stock_last_added == other._stock_last_added &&
      _stock_created == other._stock_created &&
      _stock_category == other._stock_category &&
      _organization2Inventory == other._organization2Inventory &&
      _categoryofitemsID == other._categoryofitemsID &&
      _inventoryOrganization2InventoryId == other._inventoryOrganization2InventoryId;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Inventory {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("stock_name=" + "$_stock_name" + ", ");
    buffer.write("stock_organization_id=" + "$_stock_organization_id" + ", ");
    buffer.write("stock_no=" + (_stock_no != null ? _stock_no!.toString() : "null") + ", ");
    buffer.write("stock_sold=" + (_stock_sold != null ? _stock_sold!.toString() : "null") + ", ");
    buffer.write("stock_sold_today=" + (_stock_sold_today != null ? _stock_sold_today!.toString() : "null") + ", ");
    buffer.write("stock_last_added=" + (_stock_last_added != null ? _stock_last_added!.format() : "null") + ", ");
    buffer.write("stock_created=" + "$_stock_created" + ", ");
    buffer.write("stock_category=" + "$_stock_category" + ", ");
    buffer.write("categoryofitemsID=" + "$_categoryofitemsID" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null") + ", ");
    buffer.write("inventoryOrganization2InventoryId=" + "$_inventoryOrganization2InventoryId");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Inventory copyWith({String? stock_name, String? stock_organization_id, int? stock_no, int? stock_sold, int? stock_sold_today, TemporalDate? stock_last_added, String? stock_created, String? stock_category, Organization? organization2Inventory, String? categoryofitemsID, String? inventoryOrganization2InventoryId}) {
    return Inventory._internal(
      id: id,
      stock_name: stock_name ?? this.stock_name,
      stock_organization_id: stock_organization_id ?? this.stock_organization_id,
      stock_no: stock_no ?? this.stock_no,
      stock_sold: stock_sold ?? this.stock_sold,
      stock_sold_today: stock_sold_today ?? this.stock_sold_today,
      stock_last_added: stock_last_added ?? this.stock_last_added,
      stock_created: stock_created ?? this.stock_created,
      stock_category: stock_category ?? this.stock_category,
      organization2Inventory: organization2Inventory ?? this.organization2Inventory,
      categoryofitemsID: categoryofitemsID ?? this.categoryofitemsID,
      inventoryOrganization2InventoryId: inventoryOrganization2InventoryId ?? this.inventoryOrganization2InventoryId);
  }
  
  Inventory.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _stock_name = json['stock_name'],
      _stock_organization_id = json['stock_organization_id'],
      _stock_no = (json['stock_no'] as num?)?.toInt(),
      _stock_sold = (json['stock_sold'] as num?)?.toInt(),
      _stock_sold_today = (json['stock_sold_today'] as num?)?.toInt(),
      _stock_last_added = json['stock_last_added'] != null ? TemporalDate.fromString(json['stock_last_added']) : null,
      _stock_created = json['stock_created'],
      _stock_category = json['stock_category'],
      _organization2Inventory = json['organization2Inventory']?['serializedData'] != null
        ? Organization.fromJson(new Map<String, dynamic>.from(json['organization2Inventory']['serializedData']))
        : null,
      _categoryofitemsID = json['categoryofitemsID'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null,
      _inventoryOrganization2InventoryId = json['inventoryOrganization2InventoryId'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'stock_name': _stock_name, 'stock_organization_id': _stock_organization_id, 'stock_no': _stock_no, 'stock_sold': _stock_sold, 'stock_sold_today': _stock_sold_today, 'stock_last_added': _stock_last_added?.format(), 'stock_created': _stock_created, 'stock_category': _stock_category, 'organization2Inventory': _organization2Inventory?.toJson(), 'categoryofitemsID': _categoryofitemsID, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format(), 'inventoryOrganization2InventoryId': _inventoryOrganization2InventoryId
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'stock_name': _stock_name, 'stock_organization_id': _stock_organization_id, 'stock_no': _stock_no, 'stock_sold': _stock_sold, 'stock_sold_today': _stock_sold_today, 'stock_last_added': _stock_last_added, 'stock_created': _stock_created, 'stock_category': _stock_category, 'organization2Inventory': _organization2Inventory, 'categoryofitemsID': _categoryofitemsID, 'createdAt': _createdAt, 'updatedAt': _updatedAt, 'inventoryOrganization2InventoryId': _inventoryOrganization2InventoryId
  };

  static final QueryModelIdentifier<InventoryModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<InventoryModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField STOCK_NAME = QueryField(fieldName: "stock_name");
  static final QueryField STOCK_ORGANIZATION_ID = QueryField(fieldName: "stock_organization_id");
  static final QueryField STOCK_NO = QueryField(fieldName: "stock_no");
  static final QueryField STOCK_SOLD = QueryField(fieldName: "stock_sold");
  static final QueryField STOCK_SOLD_TODAY = QueryField(fieldName: "stock_sold_today");
  static final QueryField STOCK_LAST_ADDED = QueryField(fieldName: "stock_last_added");
  static final QueryField STOCK_CREATED = QueryField(fieldName: "stock_created");
  static final QueryField STOCK_CATEGORY = QueryField(fieldName: "stock_category");
  static final QueryField ORGANIZATION2INVENTORY = QueryField(
    fieldName: "organization2Inventory",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Organization'));
  static final QueryField CATEGORYOFITEMSID = QueryField(fieldName: "categoryofitemsID");
  static final QueryField INVENTORYORGANIZATION2INVENTORYID = QueryField(fieldName: "inventoryOrganization2InventoryId");
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
      ModelIndex(fields: const ["categoryofitemsID"], name: "byCategoryOfItems")
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Inventory.STOCK_NAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Inventory.STOCK_ORGANIZATION_ID,
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
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Inventory.STOCK_SOLD_TODAY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Inventory.STOCK_LAST_ADDED,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.date)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Inventory.STOCK_CREATED,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Inventory.STOCK_CATEGORY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
      key: Inventory.ORGANIZATION2INVENTORY,
      isRequired: false,
      ofModelName: 'Organization',
      associatedKey: Organization.ID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Inventory.CATEGORYOFITEMSID,
      isRequired: true,
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
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Inventory.INVENTORYORGANIZATION2INVENTORYID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
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