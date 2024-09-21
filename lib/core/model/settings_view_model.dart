import 'package:daily_hogwarts/core/utils/enums/languages.dart';
import 'package:flutter/material.dart';

class SettingsViewModel with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  String _locale = Languages.english.name;

  ThemeMode get themeMode => _themeMode;
  String get locale => _locale;

  void setThemeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }

  void setLocale(String? locale) {
    _locale = locale ?? Languages.english.name;
    notifyListeners();
  }
}
