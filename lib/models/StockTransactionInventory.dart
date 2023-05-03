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


/** This is an auto generated class representing the StockTransactionInventory type in your schema. */
@immutable
class StockTransactionInventory extends Model {
  static const classType = const _StockTransactionInventoryModelType();
  final String id;
  final StockTransaction? _stockTransaction;
  final Inventory? _inventory;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  StockTransactionInventoryModelIdentifier get modelIdentifier {
      return StockTransactionInventoryModelIdentifier(
        id: id
      );
  }
  
  StockTransaction get stockTransaction {
    try {
      return _stockTransaction!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  Inventory get inventory {
    try {
      return _inventory!;
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
  
  const StockTransactionInventory._internal({required this.id, required stockTransaction, required inventory, createdAt, updatedAt}): _stockTransaction = stockTransaction, _inventory = inventory, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory StockTransactionInventory({String? id, required StockTransaction stockTransaction, required Inventory inventory}) {
    return StockTransactionInventory._internal(
      id: id == null ? UUID.getUUID() : id,
      stockTransaction: stockTransaction,
      inventory: inventory);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StockTransactionInventory &&
      id == other.id &&
      _stockTransaction == other._stockTransaction &&
      _inventory == other._inventory;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("StockTransactionInventory {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("stockTransaction=" + (_stockTransaction != null ? _stockTransaction!.toString() : "null") + ", ");
    buffer.write("inventory=" + (_inventory != null ? _inventory!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  StockTransactionInventory copyWith({StockTransaction? stockTransaction, Inventory? inventory}) {
    return StockTransactionInventory._internal(
      id: id,
      stockTransaction: stockTransaction ?? this.stockTransaction,
      inventory: inventory ?? this.inventory);
  }
  
  StockTransactionInventory.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _stockTransaction = json['stockTransaction']?['serializedData'] != null
        ? StockTransaction.fromJson(new Map<String, dynamic>.from(json['stockTransaction']['serializedData']))
        : null,
      _inventory = json['inventory']?['serializedData'] != null
        ? Inventory.fromJson(new Map<String, dynamic>.from(json['inventory']['serializedData']))
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'stockTransaction': _stockTransaction?.toJson(), 'inventory': _inventory?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'stockTransaction': _stockTransaction, 'inventory': _inventory, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<StockTransactionInventoryModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<StockTransactionInventoryModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField STOCKTRANSACTION = QueryField(
    fieldName: "stockTransaction",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'StockTransaction'));
  static final QueryField INVENTORY = QueryField(
    fieldName: "inventory",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Inventory'));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "StockTransactionInventory";
    modelSchemaDefinition.pluralName = "StockTransactionInventories";
    
    modelSchemaDefinition.indexes = [
      ModelIndex(fields: const ["stockTransactionId"], name: "byStockTransaction"),
      ModelIndex(fields: const ["inventoryId"], name: "byInventory")
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: StockTransactionInventory.STOCKTRANSACTION,
      isRequired: true,
      targetNames: ['stockTransactionId'],
      ofModelName: 'StockTransaction'
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: StockTransactionInventory.INVENTORY,
      isRequired: true,
      targetNames: ['inventoryId'],
      ofModelName: 'Inventory'
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

class _StockTransactionInventoryModelType extends ModelType<StockTransactionInventory> {
  const _StockTransactionInventoryModelType();
  
  @override
  StockTransactionInventory fromJson(Map<String, dynamic> jsonData) {
    return StockTransactionInventory.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'StockTransactionInventory';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [StockTransactionInventory] in your schema.
 */
@immutable
class StockTransactionInventoryModelIdentifier implements ModelIdentifier<StockTransactionInventory> {
  final String id;

  /** Create an instance of StockTransactionInventoryModelIdentifier using [id] the primary key. */
  const StockTransactionInventoryModelIdentifier({
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
  String toString() => 'StockTransactionInventoryModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is StockTransactionInventoryModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}