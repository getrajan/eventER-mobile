part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileInterestedEventsLoadingState extends ProfileState {}

class ProfileInterestedEventsLoadedState extends ProfileState {
  final List<EventEntity> events;

  ProfileInterestedEventsLoadedState(this.events);
}
