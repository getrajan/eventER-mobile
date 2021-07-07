import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eventer_app/core/usecase/usecase.dart';
import 'package:eventer_app/features/explore/data/entity/event_entity.dart';
import 'package:eventer_app/features/profile/domain/usecase/get_interested_event_usecase.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(this.getInterestedEventsUseCase) : super(ProfileInitial());

  final GetInterestedEventsUseCase getInterestedEventsUseCase;

  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    if (event is ProfileInterestedEventLoadEvent) {
      yield ProfileInterestedEventsLoadingState();
      final failOrEvents = await getInterestedEventsUseCase(NoParams());

      yield* failOrEvents.fold((fail) async* {
        yield ProfileInterestedEventsLoadingState();
      }, (events) async* {
        yield ProfileInterestedEventsLoadedState(events);
      });
    }
  }
}
