import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class FilePermissionWidget extends StatefulWidget {
  final Widget child;

  const FilePermissionWidget({super.key, required this.child});

  @override
  _FilePermissionWidgetState createState() => _FilePermissionWidgetState();
}

class _FilePermissionWidgetState extends State<FilePermissionWidget> {
  @override
  void initState() {
    super.initState();
    requestPermission();
  }

  Future<void> requestPermission() async {
    final status = await Permission.storage.request();
    if (!status.isDenied) {
      if (!status.isPermanentlyDenied) {
        if (!status.isLimited) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('File permission denied.'),
            ),
          );
        }
      }
    }
    if (status.isGranted) {}
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
            'File permission required. Please grant permission to access files.'),
        action: SnackBarAction(
          label: 'Settings',
          onPressed: openAppSettings,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
