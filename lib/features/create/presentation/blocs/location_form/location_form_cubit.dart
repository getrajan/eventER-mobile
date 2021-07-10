import 'package:bloc/bloc.dart';

part 'location_form_state.dart';

class LocationFormCubit extends Cubit<LocationFormState> {
  LocationFormCubit() : super(LocationFormState());

  void changeLocation(location) => emit(state.copyWith(location: location));
}
