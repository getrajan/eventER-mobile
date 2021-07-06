import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eventer_app/core/constant/text_constant.dart';
import 'package:eventer_app/core/utils/form_submission_status.dart';
import 'package:eventer_app/features/auth/domain/model/session_hive_model.dart';
import 'package:eventer_app/features/auth/domain/usecase/login_usecase.dart';
import 'package:eventer_app/features/auth/domain/usecase/save_hive_session_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required this.loginUseCase,
    required this.saveSessionHiveUsecase,
  }) : super(LoginState(
            email: "",
            password: "",
            formSubmissionStatus: InitialFormStatus()));

  final LoginUseCase loginUseCase;
  final SaveSessionHiveUsecase saveSessionHiveUsecase;

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is EmailChangedEvent) {
      print(event.email.length);
      yield state.copyWith(email: event.email);
    }
    if (event is PasswordChangedEveneet) {
      yield state.copyWith(password: event.password);
    }
    if (event is LoginSubmitedEvent) {
      yield state.copyWith(formSubmissionStatus: FormSubmittingStatus());
      final failOrLogin = await loginUseCase(event.loginData);
      yield* failOrLogin.fold((fail) async* {
        yield state.copyWith(
            formSubmissionStatus: FormSubmissionFailedStatus(fail.message));
      }, (login) async* {
        print("****exp ${login['exp']}");
        SessionHive session = SessionHive(
          token: login['token'],
          userId: login['data']['user']['_id'],
          verificationStatus: "verified",
          expiry: login['exp'],
        );
        await saveSessionHiveUsecase(session);
        yield state.copyWith(
            formSubmissionStatus: FormSubmissionSuccessStatus(login));
      });
    }
  }
}
