import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static Color lightBackgroundColor = const Color(0xfff2f2f2);
  static Color lightPrimaryColor = const Color.fromRGBO(240, 238, 209, 1);
  static Color lightSecondaryColor = const Color(0xff040415);
  static Color lightAccentColor = Color.fromRGBO(19, 68, 90, 1);
  static Color lightParticlesColor = const Color.fromRGBO(240, 238, 209, 1);
  static Color lightTextColor = Colors.black54;

  const AppTheme._();

  static final lightTheme = ThemeData(
      brightness: Brightness.light,
      primaryColor: lightPrimaryColor,
      backgroundColor: lightBackgroundColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: AppBarTheme(backgroundColor: lightPrimaryColor),
      colorScheme: ColorScheme.light(secondary: lightSecondaryColor),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(primary: lightBackgroundColor))
  );

  static Brightness get currentSystemBrightness =>
      SchedulerBinding.instance!.window.platformBrightness;

  static setStatusBarAndNavigationBarColors(ThemeMode themeMode) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarColor: lightBackgroundColor,
      systemNavigationBarDividerColor: Colors.transparent,
    ));
  }
}