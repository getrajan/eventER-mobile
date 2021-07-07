part of 'upcomming_event_bloc.dart';

abstract class UpcommingEventEvent extends Equatable {
  const UpcommingEventEvent();

  @override
  List<Object> get props => [];
}

class UpcommingEventsLoadEvent extends UpcommingEventEvent {}
