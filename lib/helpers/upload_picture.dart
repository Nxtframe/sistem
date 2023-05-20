import 'dart:io';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:file_picker/file_picker.dart';

Future<void> uploadPicture(String key) async {
  const dataString = 'Example file contents';

  FilePickerResult? result = await FilePicker.platform.pickFiles();
  if (result != null) {
    String? filePath = result.files.single.path;
    if (filePath != null) {
      File file = File(filePath);
      try {
        final uploadResult =
            await Amplify.Storage.uploadFile(local: file, key: key);
        // Handle successful upload
      } on StorageException catch (e) {
        safePrint(e.message);
        // Handle storage exception
      }
    } else {
      // Handle null filePath
      print('File path is null. Please try again.');
    }
  } else {
    return;
  }
}
