import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'package:universal_io/io.dart';

final ImagePicker _picker = ImagePicker();

Future<void> showImagePicker(BuildContext context, File imageFile) async {
  final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
  if (pickedFile != null) {
    imageFile = File(pickedFile.path);
  } else {
    return;
  }
}
