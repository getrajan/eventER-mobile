import 'package:eventer_app/features/explore/data/repository/i_explore_repository.dart';
import 'package:eventer_app/features/explore/data/source/explore_remote_source.dart';
import 'package:eventer_app/features/explore/domain/respository/explore_repository.dart';
import 'package:eventer_app/features/explore/domain/usecase/get_upcomming_events_usecase.dart';
import 'package:eventer_app/features/explore/presentation/blocs/upcomming_event/upcomming_event_bloc.dart';
import 'package:eventer_app/injection_container.dart';

Future<void> exploreInjection() async {
  // blocs
  sl.registerLazySingleton(
      () => UpcommingEventBloc(getUpcommingEventsUseCase: sl()));

  // usecases
  sl.registerLazySingleton(
      () => GetUpcommingEventsUseCase(exploreRepository: sl()));

  // repositories
  sl.registerLazySingleton<ExploreRepository>(
      () => IExploreRepository(exploreRemoteSource: sl(), networkInfo: sl()));

  // sources
  sl.registerLazySingleton<ExploreRemoteSource>(() => IExploreRemoteSource());
}
