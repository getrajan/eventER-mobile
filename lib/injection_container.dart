import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:eventer_app/core/network/network_info.dart';
import 'package:eventer_app/features/auth/auth_injection.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  // external
  sl.registerLazySingleton(() => DataConnectionChecker());
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton<NetworkInfo>(() => INetworkInfo(sl()));

  // auth
  authInjection();
}
