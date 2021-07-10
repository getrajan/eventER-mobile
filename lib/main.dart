// @dart=2.9

import 'package:device_preview/device_preview.dart';
import 'package:eventer_app/bloc_observer.dart';
import 'package:eventer_app/core/bloc/field_validate/field_validate_cubit.dart';
import 'package:eventer_app/core/bloc/tabbar/tabbar_cubit.dart';
import 'package:eventer_app/core/bloc/theme/theme_cubit.dart';
import 'package:eventer_app/core/router/app_router.dart';
import 'package:eventer_app/core/utils/appTheme.dart';
import 'package:eventer_app/features/auth/domain/model/session_hive_model.dart';
import 'package:eventer_app/features/auth/presentation/pages/login_page.dart';
import 'package:eventer_app/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:eventer_app/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:sizer/sizer.dart';
import 'core/bloc/image_pick/image_pick_bloc.dart';
import 'features/auth/domain/model/user_hive_model.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'features/auth/presentation/bloc/password_toggle/password_toggle_cubit.dart';
import 'features/create/presentation/blocs/change_page/change_page_cubit.dart';
import 'features/create/presentation/blocs/event_details_fill/event_details_fill_cubit.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  final appDocumentDirectory = await path.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(UserHiveAdapter());
  Hive.registerAdapter(SessionHiveAdapter());
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (_) => ThemeCubit(),
        ),
        BlocProvider<FieldValidateCubit>(create: (_) => FieldValidateCubit()),
        BlocProvider<PasswordToggleCubit>(create: (_) => PasswordToggleCubit()),
        BlocProvider<TabbarCubit>(create: (_) => getIt<TabbarCubit>()),
        BlocProvider<AuthBloc>(
            create: (_) => getIt<AuthBloc>()..add(AppStartedEvent())),
        BlocProvider<EventDetailsFillCubit>(
            create: (_) => getIt<EventDetailsFillCubit>()),
        BlocProvider<ChangePageCubit>(create: (_) => getIt<ChangePageCubit>()),
      ],
      child: EventErApp(),
    );
  }
}

class EventErApp extends StatelessWidget {
  const EventErApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, orientation) {
        return Sizer(builder: (context, constraints, orientation) {
          return BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return MaterialApp(
                builder: DevicePreview.appBuilder,
                theme: AppTheme.lightTheme,

                home: context.select(
                  (AuthBloc authBloc) {
                    if (authBloc.state is UnAuthenticatedState) {
                      return LoginPage();
                    } else if (authBloc.state is AuthLoadingState) {
                      return SplashPage();
                    } else if (authBloc.state is AuthenticatedState) {
                      return DashBoardPage();
                    } else {
                      return Container();
                    }
                  },
                ),
                themeMode: context.select(
                    (ThemeCubit themeCubit) => themeCubit.state.themeMode),
                // onGenerateRoute: AppRouter.onGenerateRoute,
                debugShowCheckedModeBanner: false,
              );
            },
          );
        });
      },
    );
  }

  String routes(AuthState state) {
    if (state is UnAuthenticatedState) {
      return AppRouter.login;
    } else if (state is AuthLoadingState) {
      return AppRouter.splash;
    } else if (state is AuthenticatedState) {
      return AppRouter.eventEr;
    } else {
      return "register";
    }
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EventEr"),
      ),
      body: Center(
          child: TextButton(
        child: Text("Logout"),
        onPressed: () {
          context.read<AuthBloc>()..add(LoggedOutEvent());
        },
      )),
    );
  }
}
