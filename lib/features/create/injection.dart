import 'package:eventer_app/features/create/presentation/blocs/change_page/change_page_cubit.dart';
import 'package:eventer_app/features/create/presentation/blocs/event_details_fill/event_details_fill_cubit.dart';
import 'package:eventer_app/features/create/presentation/blocs/select_one/select_one_cubit.dart';
import 'package:eventer_app/injection_container.dart';

Future<void> createEventInjection() async {
  // Blocs
  sl.registerFactory(() => SelectOneCubit());
  sl.registerLazySingleton(() => EventDetailsFillCubit());
  sl.registerFactory(() => ChangePageCubit());

  // usecases

  // repositories

  // sources
}
