import 'package:flutter/material.dart';

final theme = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.blue.shade900,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.blue.shade900,
  ),
  scaffoldBackgroundColor: Colors.blue.shade100,
  cardTheme: CardTheme(shadowColor: Colors.redAccent.shade400),
  textTheme: const TextTheme(
    bodyText2: TextStyle(fontWeight: FontWeight.bold),
  ),
  dialogTheme: DialogTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
  ),
);
