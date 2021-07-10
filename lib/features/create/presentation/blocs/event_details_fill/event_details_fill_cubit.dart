import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'event_details_fill_state.dart';

class EventDetailsFillCubit extends Cubit<EventDetailsFillState> {
  EventDetailsFillCubit() : super(EventDetailsFillState());

  void changeStartDate(date) => emit(state.copyWith(startDate: date));
  void changeStartTime(time) => emit(state.copyWith(startTime: time));
  void changeStartDateTime(dateTime) =>
      emit(state.copyWith(startDateTime: dateTime));
  void changeName(name) {
    print(name);
    emit(state.copyWith(name: name));
  }

  void changeEndDate(date) => emit(state.copyWith(endDate: date));
  void changeEndTime(time) => emit(state.copyWith(endTime: time));
  void changeEndDateTime(dateTime) =>
      emit(state.copyWith(endDateTime: dateTime));
  void changeDescription(description) =>
      emit(state.copyWith(description: description));

  @override
  Future<void> close() async {
    super.close();
  }
}
