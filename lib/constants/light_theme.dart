import 'package:flutter/material.dart';

final lightTheme = ThemeData.light().copyWith(
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color.fromARGB(255, 99, 73, 191),
    onPrimary: Colors.white,
    primaryContainer: Color.fromARGB(255, 231, 222, 255),
    onPrimaryContainer: Color.fromARGB(255, 30, 0, 96),
    secondary: Color.fromARGB(255, 96, 91, 113),
    onSecondary: Colors.white,
    error: Color.fromARGB(255, 186, 26, 26),
    onError: Colors.white,
    background: Color.fromARGB(255, 255, 251, 255),
    onBackground: Color.fromARGB(255, 28, 27, 30),
    surface: Color.fromARGB(255, 255, 251, 255),
    onSurface: Color.fromARGB(255, 28, 27, 30),
  ),
);
