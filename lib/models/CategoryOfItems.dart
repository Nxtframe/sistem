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


/** This is an auto generated class representing the CategoryOfItems type in your schema. */
@immutable
class CategoryOfItems extends Model {
  static const classType = const _CategoryOfItemsModelType();
  final String id;
  final String? _category_name;
  final List<Inventory>? _inventories;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  CategoryOfItemsModelIdentifier get modelIdentifier {
      return CategoryOfItemsModelIdentifier(
        id: id
      );
  }
  
  String? get category_name {
    return _category_name;
  }
  
  List<Inventory>? get inventories {
    return _inventories;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const CategoryOfItems._internal({required this.id, category_name, inventories, createdAt, updatedAt}): _category_name = category_name, _inventories = inventories, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory CategoryOfItems({String? id, String? category_name, List<Inventory>? inventories}) {
    return CategoryOfItems._internal(
      id: id == null ? UUID.getUUID() : id,
      category_name: category_name,
      inventories: inventories != null ? List<Inventory>.unmodifiable(inventories) : inventories);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CategoryOfItems &&
      id == other.id &&
      _category_name == other._category_name &&
      DeepCollectionEquality().equals(_inventories, other._inventories);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("CategoryOfItems {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("category_name=" + "$_category_name" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  CategoryOfItems copyWith({String? category_name, List<Inventory>? inventories}) {
    return CategoryOfItems._internal(
      id: id,
      category_name: category_name ?? this.category_name,
      inventories: inventories ?? this.inventories);
  }
  
  CategoryOfItems.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _category_name = json['category_name'],
      _inventories = json['inventories'] is List
        ? (json['inventories'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Inventory.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'category_name': _category_name, 'inventories': _inventories?.map((Inventory? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'category_name': _category_name, 'inventories': _inventories, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<CategoryOfItemsModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<CategoryOfItemsModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField CATEGORY_NAME = QueryField(fieldName: "category_name");
  static final QueryField INVENTORIES = QueryField(
    fieldName: "inventories",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Inventory'));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "CategoryOfItems";
    modelSchemaDefinition.pluralName = "CategoryOfItems";
    
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
      key: CategoryOfItems.CATEGORY_NAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: CategoryOfItems.INVENTORIES,
      isRequired: false,
      ofModelName: 'Inventory',
      associatedKey: Inventory.CATEGORY_ID
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

class _CategoryOfItemsModelType extends ModelType<CategoryOfItems> {
  const _CategoryOfItemsModelType();
  
  @override
  CategoryOfItems fromJson(Map<String, dynamic> jsonData) {
    return CategoryOfItems.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'CategoryOfItems';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [CategoryOfItems] in your schema.
 */
@immutable
class CategoryOfItemsModelIdentifier implements ModelIdentifier<CategoryOfItems> {
  final String id;

  /** Create an instance of CategoryOfItemsModelIdentifier using [id] the primary key. */
  const CategoryOfItemsModelIdentifier({
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
  String toString() => 'CategoryOfItemsModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is CategoryOfItemsModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}