import 'dart:async';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:sistem/models/ModelProvider.dart';

Future<String?> queryModelOne(Type functionType, String argId) async {
  try {
    List<dynamic> organisations;
    switch (functionType) {
      case Organization:
        organisations = await Amplify.DataStore.query(
          Organization.classType,
          where: Organization.ID.eq(argId),
        );
        break;
      case Inventory:
        organisations = await Amplify.DataStore.query(
          Inventory.classType,
          where: Inventory.ID.eq(argId),
        );
        break;
      case CategoryOfItems:
        organisations = await Amplify.DataStore.query(
          CategoryOfItems.classType,
          where: CategoryOfItems.ID.eq(argId),
        );
        break;
      case Employee:
        organisations = await Amplify.DataStore.query(
          Employee.classType,
          where: Employee.ID.eq(argId),
        );
        break;
      default:
        throw ArgumentError('Unsupported model type: $functionType');
    }
    if (organisations.isNotEmpty) {
      return organisations[0];
    }
  } catch (e) {
    return null;
  }
  return null;
}

//What am I writing idk
//(P1) Convert this to a class ..one day

enum InventoryQueryType {
  byCategoryOfItems,
  byOrganization,
}

//Here the query by the relation of the model instead of directly to the id
Future<List<dynamic>?> queryModelwithRelation(
    Type functionType, String argId, InventoryQueryType queryType) async {
  try {
    List<dynamic> result;
    switch (functionType) {
      case Inventory:
        switch (queryType) {
          case InventoryQueryType.byCategoryOfItems:
            result = await Amplify.DataStore.query(
              Inventory.classType,
              where: Inventory.CATEGORYOFITEMSID.eq(argId),
            );
            break;
          case InventoryQueryType.byOrganization:
            result = await Amplify.DataStore.query(
              Inventory.classType,
              where: Inventory.ORGANIZATIONID.eq(argId),
            );
            break;
          default:
            throw ArgumentError('Unsupported inventory query type: $queryType');
        }
        break;
      case CategoryOfItems:
        result = await Amplify.DataStore.query(
          CategoryOfItems.classType,
          where: CategoryOfItems.ORGANIZATIONID.eq(argId),
        );
        break;
      case Employee:
        result = await Amplify.DataStore.query(
          Employee.classType,
          where: Employee.ORGANIZATIONIDTOEMPLOYEERELATION.eq(argId),
        );
        break;
      default:
        throw ArgumentError('Unsupported model type: $functionType');
    }
    return result;
  } catch (e) {
    return null;
  }
}

Future<StreamSubscription<QuerySnapshot<Model>>?> observeModelwithRelation(
  //pass in a Mode,argId is the ID, queryType is for Inventory,and pass in a empty function
  Type functionType,
  String argId, {
  InventoryQueryType? queryType,
  void Function(QuerySnapshot<Model>)? function,
}) async {
  try {
    StreamSubscription<QuerySnapshot<Model>>? subscription;
    switch (functionType) {
      case Inventory:
        switch (queryType) {
          case InventoryQueryType.byCategoryOfItems:
            subscription = Amplify.DataStore.observeQuery(
              Inventory.classType,
              where: Inventory.CATEGORYOFITEMSID.eq(argId),
            ).listen((event) {
              function?.call(event);
            });
            break;
          case InventoryQueryType.byOrganization:
            subscription = Amplify.DataStore.observeQuery(
              Inventory.classType,
              where: Inventory.ORGANIZATIONID.eq(argId),
            ).listen((event) {
              function?.call(event);
            });
            break;
          default:
            throw ArgumentError('Unsupported inventory query type: $queryType');
        }
        break;
      case CategoryOfItems:
        subscription = Amplify.DataStore.observeQuery(
          Inventory.classType,
          where: CategoryOfItems.ORGANIZATIONID.eq(argId),
        ).listen((event) {
          function?.call(event);
        });
        break;
      case Employee:
        subscription = Amplify.DataStore.observeQuery(
          Inventory.classType,
          where: Employee.ORGANIZATIONIDTOEMPLOYEERELATION.eq(argId),
        ).listen((event) {
          function?.call(event);
        });
        break;
      default:
        throw ArgumentError('Unsupported model type: $functionType');
    }

    // return the stream subscription so it can be cancelled later
    return subscription;
  } catch (e) {
    return null;
  }
}

Future<StreamSubscription<QuerySnapshot<Model>>?> observeModel(
  //pass in a Mode,argId is the ID, queryType is for Inventory,and pass in a empty function
  Type functionType,
  String argId, {
  void Function(QuerySnapshot<Model>)? function,
}) async {
  try {
    StreamSubscription<QuerySnapshot<Model>>? subscription;
    switch (functionType) {
      case Inventory:
        subscription = Amplify.DataStore.observeQuery(
          Inventory.classType,
          where: Inventory.ID.eq(argId),
        ).listen((event) {
          function?.call(event);
        });
        break;
      case CategoryOfItems:
        subscription = Amplify.DataStore.observeQuery(
          Inventory.classType,
          where: CategoryOfItems.ID.eq(argId),
        ).listen((event) {
          function?.call(event);
        });
        break;
      case Employee:
        subscription = Amplify.DataStore.observeQuery(
          Inventory.classType,
          where: Employee.ID.eq(argId),
        ).listen((event) {
          function?.call(event);
        });
        break;
      default:
        throw ArgumentError('Unsupported model type: $functionType');
    }

    // return the stream subscription so it can be cancelled later
    return subscription;
  } catch (e) {
    return null;
  }
}
