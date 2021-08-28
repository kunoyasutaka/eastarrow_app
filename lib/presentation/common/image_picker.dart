import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'package:logger/logger.dart';
import 'package:universal_io/io.dart';

///imagePickerを起動
Future<File?> showImagePicker(BuildContext context) async {
  try {
    final ImagePicker _picker = ImagePicker();
    final XFile? _pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (_pickedFile != null) {
      File _imageFile = File(_pickedFile.path);
      return _imageFile;
    } else {
      return null;
    }
  } catch (e) {
    Logger().e(e.toString());
    return null;
  }
}
