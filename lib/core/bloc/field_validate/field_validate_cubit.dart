import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'field_validate_state.dart';

class FieldValidateCubit extends Cubit<FieldValidateState> {
  FieldValidateCubit() : super(FieldValidateState(error: ''));

  void validateField(value) {
    if (value.isEmpty) {
      emit(FieldValidateState(error: "Required"));
    }
  }
}
