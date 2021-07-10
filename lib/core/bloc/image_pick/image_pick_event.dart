part of 'image_pick_bloc.dart';

abstract class ImagePickEvent extends Equatable {
  const ImagePickEvent();

  @override
  List<Object> get props => [];
}

class ImagePickedFromGallery extends ImagePickEvent {}

class ImagePickedFromCamera extends ImagePickEvent {}

class ImageDeleted extends ImagePickEvent {}
