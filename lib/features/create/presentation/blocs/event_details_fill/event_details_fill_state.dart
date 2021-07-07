part of 'event_details_fill_cubit.dart';

class EventDetailsFillState {
  final String? startDate;
  final String? startTime;
  final String? startDateTime;
  final String? endDate;
  final String? endTime;
  final String? endDateTime;
  final String? name;
  const EventDetailsFillState({
    this.startDate,
    this.startDateTime,
    this.startTime,
    this.endDate,
    this.endTime,
    this.endDateTime,
    this.name,
  });

  EventDetailsFillState copyWith({
    String? startDate,
    String? startTime,
    String? startDateTime,
    String? endDate,
    String? endTime,
    String? endDateTime,
    String? name,
  }) {
    return EventDetailsFillState(
      startDate: startDate ?? this.startDate,
      startTime: startTime ?? this.startTime,
      startDateTime: startDateTime ?? this.startDateTime,
      endDate: endDate ?? this.endDate,
      endTime: endTime ?? this.endTime,
      endDateTime: endDateTime ?? this.endDateTime,
      name: name ?? this.name,
    );
  }
}
