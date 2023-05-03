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


/** This is an auto generated class representing the StockTransaction type in your schema. */
@immutable
class StockTransaction extends Model {
  static const classType = const _StockTransactionModelType();
  final String id;
  final TemporalDate? _date;
  final int? _quantity;
  final String? _notes;
  final List<StockTransactionInventory>? _Inventories;
  final String? _organizationID;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  StockTransactionModelIdentifier get modelIdentifier {
      return StockTransactionModelIdentifier(
        id: id
      );
  }
  
  TemporalDate? get date {
    return _date;
  }
  
  int? get quantity {
    return _quantity;
  }
  
  String? get notes {
    return _notes;
  }
  
  List<StockTransactionInventory>? get Inventories {
    return _Inventories;
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
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const StockTransaction._internal({required this.id, date, quantity, notes, Inventories, required organizationID, createdAt, updatedAt}): _date = date, _quantity = quantity, _notes = notes, _Inventories = Inventories, _organizationID = organizationID, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory StockTransaction({String? id, TemporalDate? date, int? quantity, String? notes, List<StockTransactionInventory>? Inventories, required String organizationID}) {
    return StockTransaction._internal(
      id: id == null ? UUID.getUUID() : id,
      date: date,
      quantity: quantity,
      notes: notes,
      Inventories: Inventories != null ? List<StockTransactionInventory>.unmodifiable(Inventories) : Inventories,
      organizationID: organizationID);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StockTransaction &&
      id == other.id &&
      _date == other._date &&
      _quantity == other._quantity &&
      _notes == other._notes &&
      DeepCollectionEquality().equals(_Inventories, other._Inventories) &&
      _organizationID == other._organizationID;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("StockTransaction {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("date=" + (_date != null ? _date!.format() : "null") + ", ");
    buffer.write("quantity=" + (_quantity != null ? _quantity!.toString() : "null") + ", ");
    buffer.write("notes=" + "$_notes" + ", ");
    buffer.write("organizationID=" + "$_organizationID" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  StockTransaction copyWith({TemporalDate? date, int? quantity, String? notes, List<StockTransactionInventory>? Inventories, String? organizationID}) {
    return StockTransaction._internal(
      id: id,
      date: date ?? this.date,
      quantity: quantity ?? this.quantity,
      notes: notes ?? this.notes,
      Inventories: Inventories ?? this.Inventories,
      organizationID: organizationID ?? this.organizationID);
  }
  
  StockTransaction.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _date = json['date'] != null ? TemporalDate.fromString(json['date']) : null,
      _quantity = (json['quantity'] as num?)?.toInt(),
      _notes = json['notes'],
      _Inventories = json['Inventories'] is List
        ? (json['Inventories'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => StockTransactionInventory.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _organizationID = json['organizationID'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'date': _date?.format(), 'quantity': _quantity, 'notes': _notes, 'Inventories': _Inventories?.map((StockTransactionInventory? e) => e?.toJson()).toList(), 'organizationID': _organizationID, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'date': _date, 'quantity': _quantity, 'notes': _notes, 'Inventories': _Inventories, 'organizationID': _organizationID, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<StockTransactionModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<StockTransactionModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField DATE = QueryField(fieldName: "date");
  static final QueryField QUANTITY = QueryField(fieldName: "quantity");
  static final QueryField NOTES = QueryField(fieldName: "notes");
  static final QueryField INVENTORIES = QueryField(
    fieldName: "Inventories",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'StockTransactionInventory'));
  static final QueryField ORGANIZATIONID = QueryField(fieldName: "organizationID");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "StockTransaction";
    modelSchemaDefinition.pluralName = "StockTransactions";
    
    modelSchemaDefinition.authRules = [
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
      ModelIndex(fields: const ["organizationID"], name: "byOrganization")
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: StockTransaction.DATE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.date)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: StockTransaction.QUANTITY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: StockTransaction.NOTES,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: StockTransaction.INVENTORIES,
      isRequired: false,
      ofModelName: 'StockTransactionInventory',
      associatedKey: StockTransactionInventory.STOCKTRANSACTION
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: StockTransaction.ORGANIZATIONID,
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

class _StockTransactionModelType extends ModelType<StockTransaction> {
  const _StockTransactionModelType();
  
  @override
  StockTransaction fromJson(Map<String, dynamic> jsonData) {
    return StockTransaction.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'StockTransaction';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [StockTransaction] in your schema.
 */
@immutable
class StockTransactionModelIdentifier implements ModelIdentifier<StockTransaction> {
  final String id;

  /** Create an instance of StockTransactionModelIdentifier using [id] the primary key. */
  const StockTransactionModelIdentifier({
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
  String toString() => 'StockTransactionModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is StockTransactionModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}