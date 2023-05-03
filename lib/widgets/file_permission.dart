// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';

// class FilePermissionWidget extends StatefulWidget {
//   final Widget child;

//   FilePermissionWidget({required this.child});

//   @override
//   _FilePermissionWidgetState createState() => _FilePermissionWidgetState();
// }

// class _FilePermissionWidgetState extends State<FilePermissionWidget> {
//   @override
//   void initState() {
//     super.initState();
//     requestPermission();
//   }

//   Future<void> requestPermission() async {
//     final status = await Permission.storage.request();
//     if (!status.isDenied) {
//       if(!status.isPermanentlyDenied){
//         if(status.isLimited)
//       }
    
//     }
//       showDialog(
//         context: context,
//         builder: (BuildContext context) => AlertDialog(
//           title: Text('File permission required'),
//           content: Text('Please grant permission to access files.'),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () => openAppSettings(),
//               child: Text('Settings'),
//             ),
//           ],
//         ),
//       );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return widget.child;
//   }
// }