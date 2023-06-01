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


/** This is an auto generated class representing the UseOrders type in your schema. */
@immutable
class UseOrders extends Model {
  static const classType = const _UseOrdersModelType();
  final String id;
  final String? _comments;
  final String? _dategiven;
  final String? _recipient;
  final String? _itemids;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  UseOrdersModelIdentifier get modelIdentifier {
      return UseOrdersModelIdentifier(
        id: id
      );
  }
  
  String? get comments {
    return _comments;
  }
  
  String? get dategiven {
    return _dategiven;
  }
  
  String? get recipient {
    return _recipient;
  }
  
  String? get itemids {
    return _itemids;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const UseOrders._internal({required this.id, comments, dategiven, recipient, itemids, createdAt, updatedAt}): _comments = comments, _dategiven = dategiven, _recipient = recipient, _itemids = itemids, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory UseOrders({String? id, String? comments, String? dategiven, String? recipient, String? itemids}) {
    return UseOrders._internal(
      id: id == null ? UUID.getUUID() : id,
      comments: comments,
      dategiven: dategiven,
      recipient: recipient,
      itemids: itemids);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UseOrders &&
      id == other.id &&
      _comments == other._comments &&
      _dategiven == other._dategiven &&
      _recipient == other._recipient &&
      _itemids == other._itemids;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("UseOrders {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("comments=" + "$_comments" + ", ");
    buffer.write("dategiven=" + "$_dategiven" + ", ");
    buffer.write("recipient=" + "$_recipient" + ", ");
    buffer.write("itemids=" + "$_itemids" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  UseOrders copyWith({String? comments, String? dategiven, String? recipient, String? itemids}) {
    return UseOrders._internal(
      id: id,
      comments: comments ?? this.comments,
      dategiven: dategiven ?? this.dategiven,
      recipient: recipient ?? this.recipient,
      itemids: itemids ?? this.itemids);
  }
  
  UseOrders.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _comments = json['comments'],
      _dategiven = json['dategiven'],
      _recipient = json['recipient'],
      _itemids = json['itemids'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'comments': _comments, 'dategiven': _dategiven, 'recipient': _recipient, 'itemids': _itemids, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'comments': _comments, 'dategiven': _dategiven, 'recipient': _recipient, 'itemids': _itemids, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<UseOrdersModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<UseOrdersModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField COMMENTS = QueryField(fieldName: "comments");
  static final QueryField DATEGIVEN = QueryField(fieldName: "dategiven");
  static final QueryField RECIPIENT = QueryField(fieldName: "recipient");
  static final QueryField ITEMIDS = QueryField(fieldName: "itemids");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "UseOrders";
    modelSchemaDefinition.pluralName = "UseOrders";
    
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
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: UseOrders.COMMENTS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: UseOrders.DATEGIVEN,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: UseOrders.RECIPIENT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: UseOrders.ITEMIDS,
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

class _UseOrdersModelType extends ModelType<UseOrders> {
  const _UseOrdersModelType();
  
  @override
  UseOrders fromJson(Map<String, dynamic> jsonData) {
    return UseOrders.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'UseOrders';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [UseOrders] in your schema.
 */
@immutable
class UseOrdersModelIdentifier implements ModelIdentifier<UseOrders> {
  final String id;

  /** Create an instance of UseOrdersModelIdentifier using [id] the primary key. */
  const UseOrdersModelIdentifier({
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
  String toString() => 'UseOrdersModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is UseOrdersModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}