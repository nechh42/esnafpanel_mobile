import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(backgroundColor: Colors.blue),
    scaffoldBackgroundColor: Colors.white,
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
    scaffoldBackgroundColor: Colors.grey[900],
  );
}
