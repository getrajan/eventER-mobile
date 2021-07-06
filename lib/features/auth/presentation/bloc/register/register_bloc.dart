import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eventer_app/core/constant/text_constant.dart';
import 'package:eventer_app/core/utils/form_submission_status.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc()
      : super(RegisterState(
            email: '',
            password: '',
            confirmPassword: '',
            name: '',
            isTermsConditionCheck: false,
            formSubmissionStatus: InitialFormStatus()));

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is RegisterEmailChangedEvent) {
      yield state.copyWith(email: event.email);
    }
    if (event is RegisterPasswordChangedEvent) {
      yield state.copyWith(password: event.password);
    }
    if (event is RegisterConfirmPasswordChangedEvent) {
      yield state.copyWith(confirmPassword: event.confirmPassword);
    }
    if (event is RegisterNameChangedEvent) {
      yield state.copyWith(name: event.name);
    }
    if (event is RegisterTermsConditionCheckedEvent) {
      yield state.copyWith(isTermsConditionCheck: event.isCheck);
    }
  }
}
