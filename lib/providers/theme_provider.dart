import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  ThemeData get lightTheme => ThemeData.light().copyWith(
    colorScheme: ColorScheme.light(
      primary: Colors.blue,
      secondary: Colors.green,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    ),
  );

  ThemeData get darkTheme => ThemeData.dark().copyWith(
    colorScheme: ColorScheme.dark(
      primary: Colors.deepPurple,
      secondary: Colors.orange,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
    ),
  );

  void toggleTheme(bool isDark) {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
