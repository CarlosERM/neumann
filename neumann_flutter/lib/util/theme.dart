import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  fontFamily: 'Poppins',
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color.fromRGBO(0, 0, 0, 1.000),
    onPrimary: Color.fromRGBO(255, 255, 255, 1.000),
    secondary: Color.fromRGBO(255, 255, 255, 1.000),
    onSecondary: Color.fromRGBO(0, 0, 0, 1.000),
    error: Color.fromRGBO(205, 25, 30, 1.000),
    onError: Color.fromRGBO(255, 255, 255, 1.000),
    background: Color.fromRGBO(255, 255, 255, 1.000),
    onBackground: Color.fromRGBO(255, 255, 255, 1.000),
    surface: Color.fromRGBO(255, 255, 255, 1.000),
    onSurface: Color.fromRGBO(0, 0, 0, 1.000),
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w500,
      color: Color.fromRGBO(0, 0, 0, 1.000),
    ),
    displayMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
    displaySmall: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
    headlineLarge: TextStyle(),
    headlineMedium: TextStyle(),
    headlineSmall: TextStyle(),
    titleLarge: TextStyle(),
    titleMedium: TextStyle(),
    titleSmall: TextStyle(),
    bodyLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.underline,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
    labelSmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color.fromRGBO(
        0,
        0,
        0,
        1.000,
      ),
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      minimumSize: const Size(
        double.infinity,
        48.0,
      ),
    ),
  ),
);
