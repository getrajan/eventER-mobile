import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:eventer_app/core/bloc/tabbar/tabbar_cubit.dart';
import 'package:eventer_app/core/network/network_info.dart';
import 'package:eventer_app/features/auth/auth_injection.dart';
import 'package:eventer_app/features/create/injection.dart';
import 'package:eventer_app/features/dashboard/injection.dart';
import 'package:eventer_app/features/explore/injection.dart';
import 'package:eventer_app/features/profile/injection.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  // external
  sl.registerLazySingleton(() => DataConnectionChecker());
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton<NetworkInfo>(() => INetworkInfo(sl()));

  // blocs
  sl.registerLazySingleton(() => TabbarCubit());

  // auth
  authInjection();

  // dashboard
  dashboardInjection();

  // profile
  profileInjection();
  // explore
  exploreInjection();
  // create event
  createEventInjection();
}
