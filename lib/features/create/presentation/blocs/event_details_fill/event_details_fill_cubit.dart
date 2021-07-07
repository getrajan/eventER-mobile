import 'package:bloc/bloc.dart';

part 'event_details_fill_state.dart';

class EventDetailsFillCubit extends Cubit<EventDetailsFillState> {
  EventDetailsFillCubit() : super(EventDetailsFillState()) {
    print("hey call me");
  }

  void changeStartDate(date) => emit(state.copyWith(startDate: date));
  void changeStartTime(time) => emit(state.copyWith(startTime: time));
  void changeStartDateTime(dateTime) =>
      emit(state.copyWith(startDateTime: dateTime));
  void changeName(name) => emit(state.copyWith(name: name));
  void changeEndDate(date) => emit(state.copyWith(endDate: date));
  void changeEndTime(time) => emit(state.copyWith(endTime: time));
  void changeEndDateTime(dateTime) =>
      emit(state.copyWith(endDateTime: dateTime));
}
