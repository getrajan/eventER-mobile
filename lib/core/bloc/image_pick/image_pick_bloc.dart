import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'image_pick_event.dart';
part 'image_pick_state.dart';

class ImagePickBloc extends Bloc<ImagePickEvent, ImagePickState> {
  ImagePickBloc() : super(ImagePickerEmpty());

  @override
  Stream<ImagePickState> mapEventToState(
    ImagePickEvent event,
  ) async* {
    if (event is ImagePickedFromGallery) {
      ImageSource source = ImageSource.gallery;
      PickedFile? pickedFile = await ImagePicker().getImage(
          source: source, maxHeight: 480, maxWidth: 640, imageQuality: 50);
      if (pickedFile != null && pickedFile.path.isNotEmpty) {
        yield ImagePickerSuccess(image: File(pickedFile.path));
      }
    }
    if (event is ImagePickedFromCamera) {
      ImageSource source = ImageSource.camera;
      PickedFile? pickedFile = await ImagePicker().getImage(
          source: source, maxHeight: 480, maxWidth: 640, imageQuality: 50);
      if (pickedFile != null && pickedFile.path.isNotEmpty) {
        yield ImagePickerSuccess(image: File(pickedFile.path));
      }
    }
    if (event is ImageDeleted) {
      yield ImagePickerEmpty();
    }
  }
}
