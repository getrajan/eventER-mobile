part of 'photo_stepper_bloc.dart';

class PhotoStepperEvent {
  const PhotoStepperEvent();
}

class InitPhotoStepperEvent extends PhotoStepperEvent {}

class CoverPhotoPickedEvent extends PhotoStepperEvent {
  final ImageSource imageSource;

  CoverPhotoPickedEvent(this.imageSource);
}

class FeatureImagePickedEvent extends PhotoStepperEvent {
  final List<File> images;
  final ImageSource imageSource;

  FeatureImagePickedEvent(this.images, this.imageSource);
}

class DeleteCoverPhotoEvent extends PhotoStepperEvent {}

class DeleteFeaturePhotoEvent extends PhotoStepperEvent {
  final File deletePhoto;

  DeleteFeaturePhotoEvent(this.deletePhoto);
}
