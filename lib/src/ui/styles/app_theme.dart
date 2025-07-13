import 'package:flutter/material.dart';

final appTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.deepPurpleAccent,
    foregroundColor: Colors.white,
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
  ),
  cardTheme: CardThemeData(
    color: Colors.white,
  ),
);
