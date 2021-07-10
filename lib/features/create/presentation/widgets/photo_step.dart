import 'dart:io';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:eventer_app/core/utils/typograph.dart';
import 'package:eventer_app/features/create/presentation/blocs/change_page/change_page_cubit.dart';
import 'package:eventer_app/features/create/presentation/blocs/photo_stepper/photo_stepper_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventer_app/core/utils/appTheme.dart';
import 'package:image_picker/image_picker.dart';

class PhotoStepWidget extends StatefulWidget {
  final double width;
  final double height;
  final Map<String, dynamic> eventFormData;
  const PhotoStepWidget(
      {Key? key,
      required this.height,
      required this.width,
      required this.eventFormData})
      : super(key: key);

  @override
  _PhotoStepWidgetState createState() => _PhotoStepWidgetState();
}

class _PhotoStepWidgetState extends State<PhotoStepWidget> {
  List<File> featureImages = [];
  File? coverPohto;

  @override
  void initState() {
    context.read<ChangePageCubit>()..checkValidation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PhotoStepperBloc, PhotoStepperState>(
      listener: (context, state) {
        if (state is FeaturePhotoPickedState) {
          featureImages = state.featureImages;
          widget.eventFormData['featureImages'] = featureImages;
        }
        if (state is CoverPhotoPickedState) {
          coverPohto = state.coverPhoto;
          widget.eventFormData['coverPhoto'] = coverPohto!;
        }
        if (state is CoverPhotoDeletedState) {
          coverPohto = null;
        }
        if (state is FeaturePhotoDeletedState) {
          featureImages.removeWhere((photo) => photo == state.deletedPhoto);
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: widget.width * 0.02,
        ),
        child: BlocBuilder<PhotoStepperBloc, PhotoStepperState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Photos",
                  style: Typograph.subtitleStyle,
                ),
                Text(
                  "Add events photos: cover and feature photos. Cover photo is compulsorry",
                  style: Typograph.generalStyle.copyWith(
                    fontSize: 14.0,
                  ),
                ),
                SizedBox(height: 30.0),
                Text(
                  "Cover Photo",
                  style: Typograph.generalStyle.copyWith(fontSize: 14.0),
                ),
                Row(children: [
                  GestureDetector(
                    onTap: () {
                      context.read<PhotoStepperBloc>()
                        ..add(CoverPhotoPickedEvent(ImageSource.camera));
                    },
                    child: BlocBuilder<PhotoStepperBloc, PhotoStepperState>(
                      builder: (context, coverState) {
                        return Container(
                          height: 100.0,
                          width: widget.width * 0.3,
                          decoration: BoxDecoration(
                            color: Theme.of(context).formBgColor,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Builder(
                            builder: (context) {
                              if (coverPohto != null) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.file(
                                    coverPohto!,
                                    fit: BoxFit.cover,
                                  ),
                                );
                              } else {
                                return Icon(EvaIcons.imageOutline);
                              }
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  coverPohto != null
                      ? IconButton(
                          onPressed: () {
                            context.read<PhotoStepperBloc>()
                              ..add(DeleteCoverPhotoEvent());
                          },
                          icon: Icon(Icons.delete))
                      : SizedBox.shrink()
                ]),
                SizedBox(height: 20.0),
                Text(
                  "Feature Photos (optional)",
                  style: Typograph.generalStyle.copyWith(fontSize: 14.0),
                ),
                GridView.builder(
                    itemCount: featureImages.length + 1,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 1.0,
                    ),
                    itemBuilder: (context, index) {
                      final File? feature = featureImages.isNotEmpty
                          ? (index < featureImages.length
                              ? featureImages[index]
                              : null)
                          : null;
                      return GestureDetector(
                          onTap: () {
                            if (feature == null) {
                              context.read<PhotoStepperBloc>()
                                ..add(FeatureImagePickedEvent(
                                    featureImages, ImageSource.camera));
                            } else {
                              context.read<PhotoStepperBloc>()
                                ..add(DeleteFeaturePhotoEvent(feature));
                            }
                          },
                          child: index <= 3
                              ? BlocBuilder<PhotoStepperBloc,
                                  PhotoStepperState>(
                                  builder: (context, state) {
                                    return Container(
                                      margin: EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).formBgColor,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Builder(
                                        builder: (context) {
                                          return feature != null
                                              ? ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  child: Image.file(
                                                    feature,
                                                    fit: BoxFit.cover,
                                                  ),
                                                )
                                              : Icon(
                                                  EvaIcons.cloudUploadOutline);
                                        },
                                      ),
                                    );
                                  },
                                )
                              : SizedBox.shrink());
                    })
              ],
            );
          },
        ),
      ),
    );
  }
}

/*


Container(
          margin: EdgeInsets.symmetric(
            horizontal: width * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Photos",
                style: Typograph.subtitleStyle,
              ),
              Text(
                "Add events photos: cover and feature photos. Cover photo is compulsorry",
                style: Typograph.generalStyle.copyWith(
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: 30.0),
              Text(
                "Cover Photo",
                style: Typograph.generalStyle.copyWith(fontSize: 14.0),
              ),
              BlocBuilder<ImagePickBloc, ImagePickState>(
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () {
                      context.read<ImagePickBloc>()
                        ..add(ImagePickedFromGallery());
                    },
                    child: Container(
                      height: 100.0,
                      width: width * 0.3,
                      decoration: BoxDecoration(
                        color: Theme.of(context).formBgColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Icon(EvaIcons.imageOutline),
                    ),
                  );
                },
              ),
              SizedBox(height: 20.0),
              Text(
                "Feature Photos (optional)",
                style: Typograph.generalStyle.copyWith(fontSize: 14.0),
              ),
              GridView.builder(
                  itemCount: featureImageState.featureImages.length + 1,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 1.0,
                  ),
                  itemBuilder: (context, index) {
                    final File? featureImage =
                        featureImageState.featureImages.isNotEmpty
                            ? (index < featureImageState.featureImages.length
                                ? featureImageState.featureImages[index]
                                : null)
                            : null;
                    return BlocListener<ImagePickBloc, ImagePickState>(
                      listener: (context, state) {
                        if (state is ImagePickerSuccess) {
                          context.read<FeatureImageCubit>()
                            ..addToImages(state.image);
                        }
                      },
                      child: BlocBuilder<ImagePickBloc, ImagePickState>(
                        builder: (context, state) {
                          return GestureDetector(
                              onTap: () {
                                if (featureImage == null) {
                                  context.read<ImagePickBloc>()
                                    ..add(ImagePickedFromCamera());
                                }
                              },
                              child: index <= 3
                                  ? Container(
                                      margin: EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).formBgColor,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Builder(
                                        builder: (context) {
                                          if (state is ImagePickerSuccess) {
                                            return featureImage != null
                                                ? ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    child: Image.file(
                                                      featureImage,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  )
                                                : Icon(EvaIcons
                                                    .cloudUploadOutline);
                                          }
                                          return Icon(
                                              EvaIcons.cloudUploadOutline);
                                        },
                                      ),
                                    )
                                  : SizedBox.shrink());
                        },
                      ),
                    );
                  })
            ],
          ),
        )
*/
