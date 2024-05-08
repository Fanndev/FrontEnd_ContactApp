// import 'package:alquran_kareem/theme/fonts.dart';
import 'package:flutter/material.dart';

const appBlue = Color(0xFF34ADEB);
const appBluemode = Color(0xFF4A6DED);
const appBluedarkmode = Color.fromARGB(255, 19, 44, 184);
const appBlueLight = Color(0xFFA7DAF4);
const appBluedark = Color.fromARGB(255, 2, 50, 162);
const appWhite = Color.fromARGB(255, 255, 255, 255);
const appGrey = Color(0xff5D5D5D);
const appGreen = Color(0xFF00FF00);
Color appblackCharchoel = const Color(0xff323232);

ThemeData themeLight = ThemeData(
  brightness: Brightness.light,
  primaryColor: appBlue,
  scaffoldBackgroundColor: appWhite,
  appBarTheme: const AppBarTheme(
    elevation: 4,
    backgroundColor: appBlue,
  ),
  textTheme: TextTheme(
    bodyMedium: TextStyle(color: appblackCharchoel),
    bodyLarge: TextStyle(color: appblackCharchoel),
    bodySmall: TextStyle(color: appblackCharchoel),
  ),
  tabBarTheme: TabBarTheme(labelColor: appblackCharchoel),
  textSelectionTheme: TextSelectionThemeData(cursorColor: appblackCharchoel),
);

ThemeData themeDark = ThemeData(
  brightness: Brightness.dark,
  primaryColor: appBlue,
  scaffoldBackgroundColor: appBluedark,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: appBluedark,
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: appWhite),
    bodyLarge: TextStyle(color: appWhite),
    bodySmall: TextStyle(color: appWhite),
  ),
  tabBarTheme: const TabBarTheme(labelColor: appWhite, indicatorColor: appWhite),
  textSelectionTheme: const TextSelectionThemeData(cursorColor: appWhite),
);
