part of 'create_event_bloc.dart';

class CreateEventState {
  const CreateEventState();
}

class CreateEventInitial extends CreateEventState {}

class CreateEventLoadingState extends CreateEventState {}

class CreateEventSuccessState extends CreateEventState {
  final EventEntity event;
  final String message;
  CreateEventSuccessState({required this.event, required this.message});
}

class CreateEventFailedState extends CreateEventState {
  final String message;
  CreateEventFailedState({required this.message});
}
