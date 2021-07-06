import 'package:eventer_app/features/dashboard/presentation/bloc/bottom_nav/bottom_nav_bloc.dart';
import 'package:eventer_app/injection_container.dart';

Future<void> dashboardInjection() async {
  // Blocs
  sl.registerLazySingleton(() => BottomNavBloc());
}
