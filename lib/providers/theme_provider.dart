import 'package:flutter/material.dart';
import 'package:esnafpanel_mobile/theme/app_theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  ThemeData get themeData =>
      _themeMode == ThemeMode.dark ? AppTheme.darkTheme : AppTheme.lightTheme;

  void toggleTheme() {
    _themeMode =
        _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }

  void setTheme(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }
}
