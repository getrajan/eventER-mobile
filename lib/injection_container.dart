import 'package:eventer_app/core/bloc/tabbar/tabbar_cubit.dart';
import 'package:eventer_app/core/core_injection.dart';
import 'package:eventer_app/features/auth/auth_injection.dart';
import 'package:eventer_app/features/create/injection.dart';
import 'package:eventer_app/features/dashboard/injection.dart';
import 'package:eventer_app/features/explore/injection.dart';
import 'package:eventer_app/features/profile/injection.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void init() {
  // Core
  coreInjection();

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
