import 'package:eventer_app/features/auth/data/datasource/local_datasource.dart';
import 'package:eventer_app/features/auth/data/datasource/remote_datasource.dart';
import 'package:eventer_app/features/auth/data/repository/i_auth_repository.dart';
import 'package:eventer_app/features/auth/domain/repository/auth_repository.dart';
import 'package:eventer_app/features/auth/domain/usecase/get_session_usecase.dart';
import 'package:eventer_app/features/auth/domain/usecase/login_usecase.dart';
import 'package:eventer_app/features/auth/domain/usecase/save_hive_session_usecase.dart';
import 'package:eventer_app/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:eventer_app/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> authInjection() async {
  // usecases
  sl.registerLazySingleton(() => LoginUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => SaveSessionHiveUsecase(sl()));
  sl.registerLazySingleton(() => GetSessionUsecase(authRepository: sl()));

  // repositories
  sl.registerLazySingleton<AuthRepository>(() => IAuthRepository(
      authRemoteDataSource: sl(),
      networkInfo: sl(),
      authLocalDataSource: sl()));

  // data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => IAuthRemoteDataSource(sl()));
  sl.registerLazySingleton<AuthLocalDataSource>(() => IAuthLocalDataSource());

  // blocs
  sl.registerLazySingleton(
      () => LoginBloc(loginUseCase: sl(), saveSessionHiveUsecase: sl()));
  sl.registerLazySingleton(() => AuthBloc(getSessionUsecase: sl()));
}
