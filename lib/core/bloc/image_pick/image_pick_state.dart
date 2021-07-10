part of 'image_pick_bloc.dart';

abstract class ImagePickState {
  const ImagePickState();
}

class ImagePickerEmpty extends ImagePickState {}

class ImagePickerSuccess extends ImagePickState {
  final File image;
  ImagePickerSuccess({required this.image});
}
