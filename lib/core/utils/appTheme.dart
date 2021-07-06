import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static Color lightBackgroundColor = const Color(0xfff2f2f2);
  static Color lightPrimaryColor = Colors.green.shade600;
  static Color lightAccentColor = Colors.blueGrey.shade200;
  static Color lightSemiBgColor = const Color(0xffffffff);
  static Color lightTextColor = const Color(0xFF1A2127);
  static Color lightInputFormBgColor =
      Colors.blueGrey.shade100.withOpacity(0.5);

  static Color darkBackgroundColor = const Color(0xFF1A2127);
  static Color darkPrimaryColor = const Color(0xFF1A2127);
  static Color darkAccentColor = Colors.blueGrey.shade600;
  static Color darkSemiBgColor = const Color(0x441C2A2D);
  static Color darkTextColor = const Color(0xfff2f2f2);
  static Color darkInputFormBgColor = Colors.blueGrey.shade600;

  static Color buttonColor = Color(0xFFB12341);

  AppTheme._();

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: lightPrimaryColor,
    accentColor: lightAccentColor,
    backgroundColor: lightBackgroundColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: lightPrimaryColor,
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: darkPrimaryColor,
    accentColor: darkAccentColor,
    backgroundColor: darkBackgroundColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: lightPrimaryColor,
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
      systemNavigationBarColor: themeMode == ThemeMode.light
          ? lightBackgroundColor
          : darkBackgroundColor,
      systemNavigationBarDividerColor: Colors.transparent,
    ));
  }
}

extension ThemeExtras on ThemeData {
  Color get semiBgColor => this.brightness == Brightness.light
      ? AppTheme.lightSemiBgColor
      : AppTheme.darkSemiBgColor;

  Color get textColor => this.brightness == Brightness.light
      ? AppTheme.lightTextColor
      : AppTheme.darkTextColor;

  Color get formBgColor => this.brightness == Brightness.light
      ? AppTheme.lightInputFormBgColor
      : AppTheme.darkInputFormBgColor;
  Color get worngFormBgColor => Colors.red.shade200;
  Color get correctFormBgColor => Colors.green.shade300;
  Color get buttonColor => AppTheme.buttonColor;
}
