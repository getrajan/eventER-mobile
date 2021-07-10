import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImagePickerHelper {
  Future<File> pickImage(ImageSource source) async {
    PickedFile? pickedFile = await ImagePicker().getImage(
        source: source, maxHeight: 480, maxWidth: 640, imageQuality: 50);
    return File(pickedFile!.path);
  }
}
