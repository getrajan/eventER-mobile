import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eventer_app/core/constant/text_constant.dart';
import 'package:eventer_app/core/usecase/usecase.dart';
import 'package:eventer_app/features/auth/domain/model/session_hive_model.dart';
import 'package:eventer_app/features/auth/domain/usecase/get_session_usecase.dart';
import 'package:hive/hive.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required this.getSessionUsecase,
  }) : super(AuthLoadingState());

  final GetSessionUsecase getSessionUsecase;

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AppStartedEvent) {
      // yield AuthLoadingState();
      Future.delayed(Duration(seconds: 2));
      final failOrSession = await getSessionUsecase(NoParams());
      yield* failOrSession.fold((fail) async* {
        yield UnAuthenticatedState(errorMessage: fail.message);
      }, (session) async* {
        DateTime now = DateTime.now();
        // DateTime expiry = DateTime.fromMicrosecondsSinceEpoch(session.expiry);
        // if (!now.isAfter(expiry)) {
        if (!JwtDecoder.isExpired(session.token)) {
          yield AuthenticatedState();
        } else {
          yield UnAuthenticatedState(errorMessage: TOKEN_EXPIRE_MESSAGE);
        }
      });
    }

    if (event is LoggedInEvent) {
      yield AuthenticatedState();
    }
    if (event is LoggedOutEvent) {
      var _box = await Hive.openBox<SessionHive>(HIVE_SESSION);
      _box.clear();
      yield UnAuthenticatedState(errorMessage: "logged out");
    }
  }
}
