import 'package:eventer_app/features/auth/presentation/pages/login_page.dart';
import 'package:eventer_app/features/auth/presentation/pages/register_page.dart';
import 'package:eventer_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const String eventEr = "eventer";
  static const String login = 'login';
  static const String register = "register";

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case eventEr:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case login:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case register:
        return MaterialPageRoute(builder: (_) => RegisterPage());

      default:
        throw Exception();
    }
  }
}
