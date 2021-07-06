// @dart=2.9

import 'package:device_preview/device_preview.dart';
import 'package:eventer_app/core/bloc/field_validate/field_validate_cubit.dart';
import 'package:eventer_app/core/bloc/theme/theme_cubit.dart';
import 'package:eventer_app/core/router/app_router.dart';
import 'package:eventer_app/core/utils/appTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:sizer/sizer.dart';
import 'features/auth/domain/model/user_hive_model.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'features/auth/presentation/bloc/password_toggle/password_toggle_cubit.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  final appDocumentDirectory = await path.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(UserHiveAdapter());
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
        BlocProvider<PasswordToggleCubit>(create: (_) => PasswordToggleCubit())
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
          return MaterialApp(
            builder: DevicePreview.appBuilder,
            theme: AppTheme.lightTheme,
            initialRoute: AppRouter.eventEr,
            themeMode: context
                .select((ThemeCubit themeCubit) => themeCubit.state.themeMode),
            onGenerateRoute: AppRouter.onGenerateRoute,
            debugShowCheckedModeBanner: false,
          );
        });
      },
    );
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
    );
  }
}
