import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
    fontFamily: 'Poppins',
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color.fromRGBO(255, 255, 255, 1.000),
      onPrimary: Color.fromRGBO(255, 255, 255, 1.000),
      secondary: Color.fromRGBO(255, 255, 255, 1.000),
      onSecondary: Color.fromRGBO(255, 255, 255, 1.000),
      error: Color.fromRGBO(255, 255, 255, 1.000),
      onError: Color.fromRGBO(255, 255, 255, 1.000),
      background: Color.fromRGBO(255, 255, 255, 1.000),
      onBackground: Color.fromRGBO(255, 255, 255, 1.000),
      surface: Color.fromRGBO(255, 255, 255, 1.000),
      onSurface: Color.fromRGBO(255, 255, 255, 1.000),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
      displayMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
      displaySmall: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      headlineLarge: TextStyle(),
      headlineMedium: TextStyle(),
      headlineSmall: TextStyle(),
      titleLarge: TextStyle(),
      titleMedium: TextStyle(),
      titleSmall: TextStyle(),
      bodyLarge: TextStyle(),
      bodyMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
      labelSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
    ));
