part of 'create_event_bloc.dart';

abstract class CreateEventEvent extends Equatable {
  const CreateEventEvent();

  @override
  List<Object> get props => [];
}

class CreateNewEventEvent extends CreateEventEvent {
  final Map<String, dynamic> data;

  CreateNewEventEvent({required this.data});
}
