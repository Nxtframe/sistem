import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sistem/services/permissions/permission_service.dart';

enum AppImageSource {
  camera,
  gallery,
}

abstract class MediaServiceInterface {
  PermissionService get permissionService;

  Future<File?> uploadImage(
    BuildContext context,
    AppImageSource appImageSource, {
    bool shouldCompress = true,
  });
}
