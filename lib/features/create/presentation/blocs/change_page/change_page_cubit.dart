import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eventer_app/features/create/presentation/blocs/event_details_fill/event_details_fill_cubit.dart';
import 'package:eventer_app/features/create/presentation/blocs/location_form/location_form_cubit.dart';
import 'package:eventer_app/features/create/presentation/blocs/photo_stepper/photo_stepper_bloc.dart';

part 'change_page_state.dart';

class ChangePageCubit extends Cubit<ChangePageState> {
  ChangePageCubit(
      {required this.locationFormCubit,
      required this.eventDetailsFillCubit,
      required this.photoStepperBloc})
      : super(ChangePageState(
          currentIndex: 0,
        ));

  final LocationFormCubit locationFormCubit;
  final EventDetailsFillCubit eventDetailsFillCubit;
  final PhotoStepperBloc photoStepperBloc;

  void checkValidation() {
    if (this.state.currentIndex == 0) {
      eventDetailsFillCubit.stream.listen((result) {
        if (result.name.isNotEmpty &&
            result.description.isNotEmpty &&
            result.startDateTime.isNotEmpty &&
            result.endDateTime.isNotEmpty) {
          emit(state.copyWith(buttonEnabled: true));
        } else {
          emit(state.copyWith(buttonEnabled: false));
        }
      });
    }
    if (this.state.currentIndex == 1) {
      emit(state.copyWith(buttonEnabled: false));
      locationFormCubit.stream.listen((location) {
        if (location.location.isNotEmpty) {
          emit(state.copyWith(buttonEnabled: true));
        } else {
          emit(state.copyWith(buttonEnabled: false));
        }
      });
    }
    if (this.state.currentIndex == 2) {
      emit(state.copyWith(buttonEnabled: false));
      photoStepperBloc.stream.listen((photoResult) {
        if (photoResult is CoverPhotoPickedState) {
          if (photoResult.coverPhoto.path.isNotEmpty) {
            emit(state.copyWith(buttonEnabled: true));
          } else {
            emit(state.copyWith(buttonEnabled: false));
          }
        }
        if (photoResult is CoverPhotoDeletedState) {
          emit(state.copyWith(buttonEnabled: false));
        }
        if (photoResult is FeaturePhotoPickedState) {
          if (this.state.buttonEnabled) {
            emit(state.copyWith(buttonEnabled: true));
          }
        }
        if (photoResult is FeaturePhotoDeletedState) {
          if (this.state.buttonEnabled) {
            emit(state.copyWith(buttonEnabled: true));
          }
        }
      });
    }
  }

  void onNext(index) {
    if (state.currentIndex < 2) {
      emit(state.copyWith(currentIndex: index + 1));
    }
  }

  void onPrevious(index) {
    if (state.currentIndex > 0) {
      emit(state.copyWith(currentIndex: index - 1));
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
