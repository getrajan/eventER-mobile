part of 'photo_stepper_bloc.dart';

abstract class PhotoStepperState {
  const PhotoStepperState();
}

class PhotoStepperInitial extends PhotoStepperState {}

class CoverPhotoPickedState extends PhotoStepperState {
  final File coverPhoto;

  CoverPhotoPickedState(this.coverPhoto);
}

class FeaturePhotoPickedState extends PhotoStepperState {
  final List<File> featureImages;
  final File featurePhoto;

  FeaturePhotoPickedState(this.featureImages, this.featurePhoto);
}

class CoverPhotoDeletedState extends PhotoStepperState {}

class FeaturePhotoDeletedState extends PhotoStepperState {
  final File deletedPhoto;

  FeaturePhotoDeletedState(this.deletedPhoto);
}
