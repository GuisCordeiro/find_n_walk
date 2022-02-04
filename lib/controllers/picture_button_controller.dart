import 'dart:io';

import 'package:image_picker/image_picker.dart';

class PictureButtonController {
  bool used = false;
  File? picture;

  Future<void> getPicture() async {
    final file = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
    );
    picture = File(file!.path);
    used = true;
  }
}
