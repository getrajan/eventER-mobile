import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eventer_app/features/auth/data/datasource/local_datasource.dart';
import 'package:eventer_app/features/auth/domain/model/session_hive_model.dart';

import 'package:eventer_app/features/create/domain/usecase/create_event_usecase.dart';
import 'package:eventer_app/features/explore/data/entity/event_entity.dart';

part 'create_event_event.dart';
part 'create_event_state.dart';

class CreateEventBloc extends Bloc<CreateEventEvent, CreateEventState> {
  CreateEventBloc(this.createEventUseCase, this.authLocalDataSource)
      : super(CreateEventInitial());
  final CreateEventUseCase createEventUseCase;
  final AuthLocalDataSource authLocalDataSource;

  @override
  Stream<CreateEventState> mapEventToState(
    CreateEventEvent event,
  ) async* {
    if (event is CreateNewEventEvent) {
      yield CreateEventLoadingState();
      final SessionHive session = await authLocalDataSource.getSession();
      Map<String, dynamic> params = {
        "data": event.data,
        "token": session.token
      };
      final failOrCreate = await createEventUseCase(params);
      yield* failOrCreate.fold((fail) async* {
        yield CreateEventFailedState(message: fail.message);
      }, (event) async* {
        yield CreateEventSuccessState(
            event: event, message: "Event is created successfully");
      });
    }
  }
}
