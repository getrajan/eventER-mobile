import 'package:eventer_app/features/auth/presentation/pages/login_page.dart';
import 'package:eventer_app/features/auth/presentation/pages/register_page.dart';
import 'package:eventer_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const String eventEr = "eventer";
  static const String login = 'login';
  static const String register = "register";
  static const String splash = "splash";

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    print("router ${settings.name}");
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => SplashPage());
      case eventEr:
        return MaterialPageRoute(builder: (_) => EventErApp());
      case login:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case register:
        return MaterialPageRoute(builder: (_) => RegisterPage());

      default:
        throw Exception();
    }
  }
}

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(child: Text("Splash Screen")),
      ),
    );
  }
}
