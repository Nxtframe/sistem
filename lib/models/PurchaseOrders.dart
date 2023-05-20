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


/** This is an auto generated class representing the PurchaseOrders type in your schema. */
@immutable
class PurchaseOrders extends Model {
  static const classType = const _PurchaseOrdersModelType();
  final String id;
  final double? _totalPrice;
  final String? _address;
  final String? _comments;
  final String? _organizationID;
  final String? _employeeID;
  final bool? _received;
  final bool? _paid;
  final List<InventoryPurchaseOrders>? _inventorys;
  final String? _noofinventoryitems;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  PurchaseOrdersModelIdentifier get modelIdentifier {
      return PurchaseOrdersModelIdentifier(
        id: id
      );
  }
  
  double? get totalPrice {
    return _totalPrice;
  }
  
  String? get address {
    return _address;
  }
  
  String? get comments {
    return _comments;
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
  
  String get employeeID {
    try {
      return _employeeID!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  bool? get received {
    return _received;
  }
  
  bool? get paid {
    return _paid;
  }
  
  List<InventoryPurchaseOrders>? get inventorys {
    return _inventorys;
  }
  
  String? get noofinventoryitems {
    return _noofinventoryitems;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const PurchaseOrders._internal({required this.id, totalPrice, address, comments, required organizationID, required employeeID, received, paid, inventorys, noofinventoryitems, createdAt, updatedAt}): _totalPrice = totalPrice, _address = address, _comments = comments, _organizationID = organizationID, _employeeID = employeeID, _received = received, _paid = paid, _inventorys = inventorys, _noofinventoryitems = noofinventoryitems, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory PurchaseOrders({String? id, double? totalPrice, String? address, String? comments, required String organizationID, required String employeeID, bool? received, bool? paid, List<InventoryPurchaseOrders>? inventorys, String? noofinventoryitems}) {
    return PurchaseOrders._internal(
      id: id == null ? UUID.getUUID() : id,
      totalPrice: totalPrice,
      address: address,
      comments: comments,
      organizationID: organizationID,
      employeeID: employeeID,
      received: received,
      paid: paid,
      inventorys: inventorys != null ? List<InventoryPurchaseOrders>.unmodifiable(inventorys) : inventorys,
      noofinventoryitems: noofinventoryitems);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PurchaseOrders &&
      id == other.id &&
      _totalPrice == other._totalPrice &&
      _address == other._address &&
      _comments == other._comments &&
      _organizationID == other._organizationID &&
      _employeeID == other._employeeID &&
      _received == other._received &&
      _paid == other._paid &&
      DeepCollectionEquality().equals(_inventorys, other._inventorys) &&
      _noofinventoryitems == other._noofinventoryitems;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("PurchaseOrders {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("totalPrice=" + (_totalPrice != null ? _totalPrice!.toString() : "null") + ", ");
    buffer.write("address=" + "$_address" + ", ");
    buffer.write("comments=" + "$_comments" + ", ");
    buffer.write("organizationID=" + "$_organizationID" + ", ");
    buffer.write("employeeID=" + "$_employeeID" + ", ");
    buffer.write("received=" + (_received != null ? _received!.toString() : "null") + ", ");
    buffer.write("paid=" + (_paid != null ? _paid!.toString() : "null") + ", ");
    buffer.write("noofinventoryitems=" + "$_noofinventoryitems" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  PurchaseOrders copyWith({double? totalPrice, String? address, String? comments, String? organizationID, String? employeeID, bool? received, bool? paid, List<InventoryPurchaseOrders>? inventorys, String? noofinventoryitems}) {
    return PurchaseOrders._internal(
      id: id,
      totalPrice: totalPrice ?? this.totalPrice,
      address: address ?? this.address,
      comments: comments ?? this.comments,
      organizationID: organizationID ?? this.organizationID,
      employeeID: employeeID ?? this.employeeID,
      received: received ?? this.received,
      paid: paid ?? this.paid,
      inventorys: inventorys ?? this.inventorys,
      noofinventoryitems: noofinventoryitems ?? this.noofinventoryitems);
  }
  
  PurchaseOrders.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _totalPrice = (json['totalPrice'] as num?)?.toDouble(),
      _address = json['address'],
      _comments = json['comments'],
      _organizationID = json['organizationID'],
      _employeeID = json['employeeID'],
      _received = json['received'],
      _paid = json['paid'],
      _inventorys = json['inventorys'] is List
        ? (json['inventorys'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => InventoryPurchaseOrders.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _noofinventoryitems = json['noofinventoryitems'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'totalPrice': _totalPrice, 'address': _address, 'comments': _comments, 'organizationID': _organizationID, 'employeeID': _employeeID, 'received': _received, 'paid': _paid, 'inventorys': _inventorys?.map((InventoryPurchaseOrders? e) => e?.toJson()).toList(), 'noofinventoryitems': _noofinventoryitems, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'totalPrice': _totalPrice, 'address': _address, 'comments': _comments, 'organizationID': _organizationID, 'employeeID': _employeeID, 'received': _received, 'paid': _paid, 'inventorys': _inventorys, 'noofinventoryitems': _noofinventoryitems, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<PurchaseOrdersModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<PurchaseOrdersModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField TOTALPRICE = QueryField(fieldName: "totalPrice");
  static final QueryField ADDRESS = QueryField(fieldName: "address");
  static final QueryField COMMENTS = QueryField(fieldName: "comments");
  static final QueryField ORGANIZATIONID = QueryField(fieldName: "organizationID");
  static final QueryField EMPLOYEEID = QueryField(fieldName: "employeeID");
  static final QueryField RECEIVED = QueryField(fieldName: "received");
  static final QueryField PAID = QueryField(fieldName: "paid");
  static final QueryField INVENTORYS = QueryField(
    fieldName: "inventorys",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'InventoryPurchaseOrders'));
  static final QueryField NOOFINVENTORYITEMS = QueryField(fieldName: "noofinventoryitems");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "PurchaseOrders";
    modelSchemaDefinition.pluralName = "PurchaseOrders";
    
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
      ModelIndex(fields: const ["organizationID"], name: "byOrganization"),
      ModelIndex(fields: const ["employeeID"], name: "byEmployee")
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: PurchaseOrders.TOTALPRICE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: PurchaseOrders.ADDRESS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: PurchaseOrders.COMMENTS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: PurchaseOrders.ORGANIZATIONID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: PurchaseOrders.EMPLOYEEID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: PurchaseOrders.RECEIVED,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: PurchaseOrders.PAID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: PurchaseOrders.INVENTORYS,
      isRequired: false,
      ofModelName: 'InventoryPurchaseOrders',
      associatedKey: InventoryPurchaseOrders.PURCHASEORDERS
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: PurchaseOrders.NOOFINVENTORYITEMS,
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

class _PurchaseOrdersModelType extends ModelType<PurchaseOrders> {
  const _PurchaseOrdersModelType();
  
  @override
  PurchaseOrders fromJson(Map<String, dynamic> jsonData) {
    return PurchaseOrders.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'PurchaseOrders';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [PurchaseOrders] in your schema.
 */
@immutable
class PurchaseOrdersModelIdentifier implements ModelIdentifier<PurchaseOrders> {
  final String id;

  /** Create an instance of PurchaseOrdersModelIdentifier using [id] the primary key. */
  const PurchaseOrdersModelIdentifier({
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
  String toString() => 'PurchaseOrdersModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is PurchaseOrdersModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}