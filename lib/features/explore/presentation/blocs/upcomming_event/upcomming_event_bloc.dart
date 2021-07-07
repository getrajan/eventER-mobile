import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eventer_app/core/usecase/usecase.dart';
import 'package:eventer_app/features/explore/data/entity/event_entity.dart';
import 'package:eventer_app/features/explore/domain/usecase/get_upcomming_events_usecase.dart';

part 'upcomming_event_event.dart';
part 'upcomming_event_state.dart';

class UpcommingEventBloc
    extends Bloc<UpcommingEventEvent, UpcommingEventState> {
  UpcommingEventBloc({required this.getUpcommingEventsUseCase})
      : super(UpcommingEventInitial());

  final GetUpcommingEventsUseCase getUpcommingEventsUseCase;

  @override
  Stream<UpcommingEventState> mapEventToState(
    UpcommingEventEvent event,
  ) async* {
    if (event is UpcommingEventsLoadEvent) {
      yield UpcommingEventLoadingState();
      final failOrEvents = await getUpcommingEventsUseCase(NoParams());

      yield* failOrEvents.fold((fail) async* {
        yield UpcommingEventsFailedState(message: fail.message);
      }, (events) async* {
        yield UpcommingEventsLoadedState(events: events);
      });
    }
  }
}
