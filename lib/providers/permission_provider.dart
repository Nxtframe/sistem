import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/permissions/PermissionHandlerPermissionService.dart';
import '../services/permissions/permission_service.dart';

final permissionServiceProvider = Provider<PermissionService>((ref) {
  return PermissionHandlerPermissionService(); // return your concrete implementation here
});
