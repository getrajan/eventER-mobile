import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:eventer_app/core/bloc/image_pick/image_pick_bloc.dart';
import 'package:eventer_app/core/bloc/tabbar/tabbar_cubit.dart';
import 'package:eventer_app/core/network/network_info.dart';
import 'package:eventer_app/core/utils/image_picker_helper.dart';
import 'package:eventer_app/injection_container.dart';
import 'package:http/http.dart' as http;

Future<void> coreInjection() async {
  // Blocs
  sl.registerLazySingleton(() => ImagePickBloc());
  sl.registerLazySingleton(() => TabbarCubit());

  // external
  sl.registerLazySingleton(() => DataConnectionChecker());
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton<NetworkInfo>(() => INetworkInfo(sl()));
  sl.registerLazySingleton(() => ImagePickerHelper());
}
