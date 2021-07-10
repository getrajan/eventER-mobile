import 'package:eventer_app/features/create/data/repository/i_event_create_repository.dart';
import 'package:eventer_app/features/create/data/source/remote_sourece.dart';
import 'package:eventer_app/features/create/domain/repository/event_create_repostitory.dart';
import 'package:eventer_app/features/create/domain/usecase/create_event_usecase.dart';
import 'package:eventer_app/features/create/presentation/blocs/change_page/change_page_cubit.dart';
import 'package:eventer_app/features/create/presentation/blocs/create_event/create_event_bloc.dart';
import 'package:eventer_app/features/create/presentation/blocs/event_details_fill/event_details_fill_cubit.dart';
import 'package:eventer_app/features/create/presentation/blocs/location_form/location_form_cubit.dart';
import 'package:eventer_app/features/create/presentation/blocs/photo_stepper/photo_stepper_bloc.dart';
import 'package:eventer_app/features/create/presentation/blocs/select_one/select_one_cubit.dart';
import 'package:eventer_app/injection_container.dart';

Future<void> createEventInjection() async {
  // Blocs
  sl.registerFactory(() => SelectOneCubit());
  sl.registerLazySingleton(() => PhotoStepperBloc(imagePickerHelper: sl()));
  sl.registerLazySingleton(() => EventDetailsFillCubit());
  sl.registerLazySingleton(() => LocationFormCubit());
  sl.registerLazySingleton(() => ChangePageCubit(
      locationFormCubit: sl(),
      eventDetailsFillCubit: sl(),
      photoStepperBloc: sl()));
  sl.registerLazySingleton(() => CreateEventBloc(sl(), sl()));

  // usecases
  sl.registerLazySingleton(() => CreateEventUseCase(sl()));

  // repositories
  sl.registerLazySingleton<EventCreateRepository>(
      () => IEventCreateRepository(sl(), sl()));

  // sources
  sl.registerLazySingleton<EventCreateRemoteSource>(
      () => IEventCreateRemoteSource());
}
