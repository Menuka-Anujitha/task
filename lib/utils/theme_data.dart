import 'package:flutter/material.dart';

class ThemeClass {
  static ThemeData darkTheme = ThemeData(
    primaryColor: ThemeData.dark().primaryColor,
    scaffoldBackgroundColor: ThemeData.dark().primaryColor,
    colorScheme: const ColorScheme.dark().copyWith(
      primary: Colors.white,
    ),
  );
}
