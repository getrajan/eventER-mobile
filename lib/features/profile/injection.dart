import 'package:eventer_app/features/profile/data/datasource/local_source.dart';
import 'package:eventer_app/features/profile/data/repository/i_profile_respository.dart';
import 'package:eventer_app/features/profile/domain/repository/profile_repository.dart';
import 'package:eventer_app/features/profile/domain/usecase/get_interested_event_usecase.dart';
import 'package:eventer_app/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:eventer_app/injection_container.dart';

Future<void> profileInjection() async {
  // Blocs
  sl.registerLazySingleton(() => ProfileBloc(sl()));

  // usecases
  sl.registerLazySingleton(() => GetInterestedEventsUseCase(sl()));

  // repositories
  sl.registerLazySingleton<ProfileRepository>(() => IProfileRepository(sl()));

  // sources
  sl.registerLazySingleton<LocalProfileDataSource>(
      () => ILocalProfileDataSource());
}
