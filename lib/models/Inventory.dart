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


/** This is an auto generated class representing the Inventory type in your schema. */
@immutable
class Inventory extends Model {
  static const classType = const _InventoryModelType();
  final String id;
  final String? _stock_image;
  final double? _stock_price;
  final int? _stock_sold;
  final int? _stock_sold_today;
  final TemporalDate? _stock_last_added;
  final String? _stock_created;
  final String? _organizationID;
  final String? _categoryofitemsID;
  final int? _stock_no;
  final List<StockTransactionInventory>? _stocktransactions;
  final List<InventoryPurchaseOrders>? _purchaseOrders;
  final String? _stock_name;
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
  
  String? get stock_image {
    return _stock_image;
  }
  
  double? get stock_price {
    return _stock_price;
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
  
  String get organizationID {
    try {
      return _organizationID!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
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
  
  int? get stock_no {
    return _stock_no;
  }
  
  List<StockTransactionInventory>? get stocktransactions {
    return _stocktransactions;
  }
  
  List<InventoryPurchaseOrders>? get purchaseOrders {
    return _purchaseOrders;
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
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Inventory._internal({required this.id, stock_image, stock_price, stock_sold, stock_sold_today, stock_last_added, stock_created, required organizationID, required categoryofitemsID, stock_no, stocktransactions, purchaseOrders, required stock_name, createdAt, updatedAt}): _stock_image = stock_image, _stock_price = stock_price, _stock_sold = stock_sold, _stock_sold_today = stock_sold_today, _stock_last_added = stock_last_added, _stock_created = stock_created, _organizationID = organizationID, _categoryofitemsID = categoryofitemsID, _stock_no = stock_no, _stocktransactions = stocktransactions, _purchaseOrders = purchaseOrders, _stock_name = stock_name, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Inventory({String? id, String? stock_image, double? stock_price, int? stock_sold, int? stock_sold_today, TemporalDate? stock_last_added, String? stock_created, required String organizationID, required String categoryofitemsID, int? stock_no, List<StockTransactionInventory>? stocktransactions, List<InventoryPurchaseOrders>? purchaseOrders, required String stock_name}) {
    return Inventory._internal(
      id: id == null ? UUID.getUUID() : id,
      stock_image: stock_image,
      stock_price: stock_price,
      stock_sold: stock_sold,
      stock_sold_today: stock_sold_today,
      stock_last_added: stock_last_added,
      stock_created: stock_created,
      organizationID: organizationID,
      categoryofitemsID: categoryofitemsID,
      stock_no: stock_no,
      stocktransactions: stocktransactions != null ? List<StockTransactionInventory>.unmodifiable(stocktransactions) : stocktransactions,
      purchaseOrders: purchaseOrders != null ? List<InventoryPurchaseOrders>.unmodifiable(purchaseOrders) : purchaseOrders,
      stock_name: stock_name);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Inventory &&
      id == other.id &&
      _stock_image == other._stock_image &&
      _stock_price == other._stock_price &&
      _stock_sold == other._stock_sold &&
      _stock_sold_today == other._stock_sold_today &&
      _stock_last_added == other._stock_last_added &&
      _stock_created == other._stock_created &&
      _organizationID == other._organizationID &&
      _categoryofitemsID == other._categoryofitemsID &&
      _stock_no == other._stock_no &&
      DeepCollectionEquality().equals(_stocktransactions, other._stocktransactions) &&
      DeepCollectionEquality().equals(_purchaseOrders, other._purchaseOrders) &&
      _stock_name == other._stock_name;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Inventory {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("stock_image=" + "$_stock_image" + ", ");
    buffer.write("stock_price=" + (_stock_price != null ? _stock_price!.toString() : "null") + ", ");
    buffer.write("stock_sold=" + (_stock_sold != null ? _stock_sold!.toString() : "null") + ", ");
    buffer.write("stock_sold_today=" + (_stock_sold_today != null ? _stock_sold_today!.toString() : "null") + ", ");
    buffer.write("stock_last_added=" + (_stock_last_added != null ? _stock_last_added!.format() : "null") + ", ");
    buffer.write("stock_created=" + "$_stock_created" + ", ");
    buffer.write("organizationID=" + "$_organizationID" + ", ");
    buffer.write("categoryofitemsID=" + "$_categoryofitemsID" + ", ");
    buffer.write("stock_no=" + (_stock_no != null ? _stock_no!.toString() : "null") + ", ");
    buffer.write("stock_name=" + "$_stock_name" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Inventory copyWith({String? stock_image, double? stock_price, int? stock_sold, int? stock_sold_today, TemporalDate? stock_last_added, String? stock_created, String? organizationID, String? categoryofitemsID, int? stock_no, List<StockTransactionInventory>? stocktransactions, List<InventoryPurchaseOrders>? purchaseOrders, String? stock_name}) {
    return Inventory._internal(
      id: id,
      stock_image: stock_image ?? this.stock_image,
      stock_price: stock_price ?? this.stock_price,
      stock_sold: stock_sold ?? this.stock_sold,
      stock_sold_today: stock_sold_today ?? this.stock_sold_today,
      stock_last_added: stock_last_added ?? this.stock_last_added,
      stock_created: stock_created ?? this.stock_created,
      organizationID: organizationID ?? this.organizationID,
      categoryofitemsID: categoryofitemsID ?? this.categoryofitemsID,
      stock_no: stock_no ?? this.stock_no,
      stocktransactions: stocktransactions ?? this.stocktransactions,
      purchaseOrders: purchaseOrders ?? this.purchaseOrders,
      stock_name: stock_name ?? this.stock_name);
  }
  
  Inventory.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _stock_image = json['stock_image'],
      _stock_price = (json['stock_price'] as num?)?.toDouble(),
      _stock_sold = (json['stock_sold'] as num?)?.toInt(),
      _stock_sold_today = (json['stock_sold_today'] as num?)?.toInt(),
      _stock_last_added = json['stock_last_added'] != null ? TemporalDate.fromString(json['stock_last_added']) : null,
      _stock_created = json['stock_created'],
      _organizationID = json['organizationID'],
      _categoryofitemsID = json['categoryofitemsID'],
      _stock_no = (json['stock_no'] as num?)?.toInt(),
      _stocktransactions = json['stocktransactions'] is List
        ? (json['stocktransactions'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => StockTransactionInventory.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _purchaseOrders = json['purchaseOrders'] is List
        ? (json['purchaseOrders'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => InventoryPurchaseOrders.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _stock_name = json['stock_name'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'stock_image': _stock_image, 'stock_price': _stock_price, 'stock_sold': _stock_sold, 'stock_sold_today': _stock_sold_today, 'stock_last_added': _stock_last_added?.format(), 'stock_created': _stock_created, 'organizationID': _organizationID, 'categoryofitemsID': _categoryofitemsID, 'stock_no': _stock_no, 'stocktransactions': _stocktransactions?.map((StockTransactionInventory? e) => e?.toJson()).toList(), 'purchaseOrders': _purchaseOrders?.map((InventoryPurchaseOrders? e) => e?.toJson()).toList(), 'stock_name': _stock_name, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'stock_image': _stock_image, 'stock_price': _stock_price, 'stock_sold': _stock_sold, 'stock_sold_today': _stock_sold_today, 'stock_last_added': _stock_last_added, 'stock_created': _stock_created, 'organizationID': _organizationID, 'categoryofitemsID': _categoryofitemsID, 'stock_no': _stock_no, 'stocktransactions': _stocktransactions, 'purchaseOrders': _purchaseOrders, 'stock_name': _stock_name, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<InventoryModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<InventoryModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField STOCK_IMAGE = QueryField(fieldName: "stock_image");
  static final QueryField STOCK_PRICE = QueryField(fieldName: "stock_price");
  static final QueryField STOCK_SOLD = QueryField(fieldName: "stock_sold");
  static final QueryField STOCK_SOLD_TODAY = QueryField(fieldName: "stock_sold_today");
  static final QueryField STOCK_LAST_ADDED = QueryField(fieldName: "stock_last_added");
  static final QueryField STOCK_CREATED = QueryField(fieldName: "stock_created");
  static final QueryField ORGANIZATIONID = QueryField(fieldName: "organizationID");
  static final QueryField CATEGORYOFITEMSID = QueryField(fieldName: "categoryofitemsID");
  static final QueryField STOCK_NO = QueryField(fieldName: "stock_no");
  static final QueryField STOCKTRANSACTIONS = QueryField(
    fieldName: "stocktransactions",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'StockTransactionInventory'));
  static final QueryField PURCHASEORDERS = QueryField(
    fieldName: "purchaseOrders",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'InventoryPurchaseOrders'));
  static final QueryField STOCK_NAME = QueryField(fieldName: "stock_name");
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
      ModelIndex(fields: const ["organizationID"], name: "byOrganization"),
      ModelIndex(fields: const ["categoryofitemsID"], name: "byCategoryOfItems")
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Inventory.STOCK_IMAGE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Inventory.STOCK_PRICE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
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
      key: Inventory.ORGANIZATIONID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Inventory.CATEGORYOFITEMSID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Inventory.STOCK_NO,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Inventory.STOCKTRANSACTIONS,
      isRequired: false,
      ofModelName: 'StockTransactionInventory',
      associatedKey: StockTransactionInventory.INVENTORY
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Inventory.PURCHASEORDERS,
      isRequired: false,
      ofModelName: 'InventoryPurchaseOrders',
      associatedKey: InventoryPurchaseOrders.INVENTORY
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Inventory.STOCK_NAME,
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