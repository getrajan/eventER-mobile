import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:eventer_app/core/utils/image_picker_helper.dart';
import 'package:image_picker/image_picker.dart';

part 'photo_stepper_event.dart';
part 'photo_stepper_state.dart';

class PhotoStepperBloc extends Bloc<PhotoStepperEvent, PhotoStepperState> {
  PhotoStepperBloc({required this.imagePickerHelper})
      : super(PhotoStepperInitial());
  final ImagePickerHelper imagePickerHelper;

  @override
  Stream<PhotoStepperState> mapEventToState(
    PhotoStepperEvent event,
  ) async* {
    if (event is CoverPhotoPickedEvent) {
      final coverPhoto = await imagePickerHelper.pickImage(event.imageSource);
      yield CoverPhotoPickedState(coverPhoto);
    }
    if (event is FeatureImagePickedEvent) {
      final File featureImage =
          await imagePickerHelper.pickImage(event.imageSource);
      event.images.add(featureImage);
      yield FeaturePhotoPickedState(
          event.images.toSet().toList(), featureImage);
    }
    if (event is InitPhotoStepperEvent) {
      yield PhotoStepperInitial();
    }
    if (event is DeleteCoverPhotoEvent) {
      yield CoverPhotoDeletedState();
    }
    if (event is DeleteFeaturePhotoEvent) {
      yield FeaturePhotoDeletedState(event.deletePhoto);
    }
  }
}
