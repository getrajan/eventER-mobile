part of 'upcomming_event_bloc.dart';

abstract class UpcommingEventState extends Equatable {
  const UpcommingEventState();

  @override
  List<Object> get props => [];
}

class UpcommingEventInitial extends UpcommingEventState {}

class UpcommingEventLoadingState extends UpcommingEventState {}

class UpcommingEventsLoadedState extends UpcommingEventState {
  final List<EventEntity> events;
  UpcommingEventsLoadedState({required this.events});
}

class UpcommingEventsFailedState extends UpcommingEventState {
  final String message;
  UpcommingEventsFailedState({required this.message});
}
