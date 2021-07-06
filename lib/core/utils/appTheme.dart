import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

class AppTheme {
  // static Color lightBackgroundColor = const Color(0xfff2f2f2);
  // // static Color lightPrimaryColor = Colors.green.shade600;
  // static Color lightPrimaryColor = Color(0xFFFF0077);
  // // static Color lightAccentColor = Colors.blueGrey.shade200;
  // static Color lightAccentColor = Color(0xFFFFDDED);
  // static Color lightSemiBgColor = const Color(0xffffffff);
  static Color lightTextColor = const Color(0xFF1A2127);
  // static Color lightInputFormBgColor =
  //     Colors.blueGrey.shade100.withOpacity(0.5);

  // // static Color darkBackgroundColor = const Color(0xFF1A2127);
  // static Color darkBackgroundColor = const Color(0xFF5C6066);
  // static Color darkPrimaryColor = const Color(0xFF5C6066);
  // // static Color darkAccentColor = Colors.blueGrey.shade600;
  // static Color darkAccentColor = Color(0xFFDCDCDC);
  // static Color darkSemiBgColor = const Color(0x441C2A2D);
  static Color darkTextColor = const Color(0xfff2f2f2);
  // static Color darkInputFormBgColor = Colors.blueGrey.shade600;

  // static Color buttonColor = Color(0xFFFF0077);

  static const Color primaryColor = Color(0xFFFF0077);
  static const Color darkColor = Color(0xFF212121);
  static const Color lightPinkColor = Color(0xFFFFDDED);
  static const Color semiDarkColor = Color(0xFF424242);
  static const Color halfDarkColor = Color(0xff757575);
  static const Color lightColor = Color(0xFFFFFFFF);
  static const Color semiLightColor = Color(0xFFf5f5f5);
  static const Color halfLightColor = Color(0xffe0e0e0);
  static const Color redColor = Color(0xFFff1744);

  AppTheme._();

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    accentColor: lightColor,
    backgroundColor: lightColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: semiLightColor,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: primaryColor,
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    accentColor: darkColor,
    backgroundColor: darkColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: semiDarkColor,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: primaryColor,
    ),
  );

  static Brightness get currentSystemBrightness =>
      SchedulerBinding.instance!.window.platformBrightness;

  static setStatusBarAndNavigationBarColors(ThemeMode themeMode) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness:
          themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
      systemNavigationBarIconBrightness:
          themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
      systemNavigationBarColor:
          themeMode == ThemeMode.light ? lightColor : darkColor,
      systemNavigationBarDividerColor: Colors.transparent,
    ));
  }
}

extension ThemeExtras on ThemeData {
  Color get semiBgColor => this.brightness == Brightness.light
      ? AppTheme.semiDarkColor
      : AppTheme.semiLightColor;

  Color get textColor => this.brightness == Brightness.light
      ? AppTheme.darkColor
      : AppTheme.lightColor;

  Color get formBgColor => this.brightness == Brightness.light
      ? AppTheme.halfLightColor
      : AppTheme.halfDarkColor;
  Color get shadowColor => this.brightness == Brightness.light
      ? AppTheme.semiDarkColor
      : AppTheme.semiLightColor;
  Color get worngFormBgColor => Colors.red.shade200;
  Color get correctFormBgColor => Color(0xff00e676).withOpacity(0.3);
  Color get buttonColor => AppTheme.primaryColor;
}
