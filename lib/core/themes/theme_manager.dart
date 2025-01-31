import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/shared.dart';

class ThemeManager with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  get themeMode => _themeMode;

  toggleTheme(bool isDark) {
    Shared.putBOOL(key: "isDark", value: isDark);
    _themeMode =
        Shared.getBOOL(key: "isDark") ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
