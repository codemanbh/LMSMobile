import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _currentTheme = ThemeMode.dark;
  ThemeMode get currentTheme => _currentTheme;
  String _currentThemeName = 'dark';
  bool _isDarkMode = true;
  // String get currentThemeName => _currentThemeName;

  void _swithToLightTheme() {
    // print('s');
    _currentTheme = ThemeMode.light;
    _currentThemeName = 'light';
    _isDarkMode = false;

    notifyListeners();
  }

  // void get swithToLightTheme => _swithToLightTheme;

  void _swithToDarkTheme() {
    _currentTheme = ThemeMode.dark;
    _currentThemeName = 'dark';
    _isDarkMode = true;

    notifyListeners();
  }

  void _toggleThemeMode() {
    if (_currentThemeName == 'dark') {
      _swithToLightTheme();
    } else {
      _swithToDarkTheme();
    }
  }

  bool get isDarkMode => _isDarkMode;

  Function get toggleThemeMode => _toggleThemeMode;
  Function get switchToLightTheme => _swithToLightTheme;
  Function get switchToDarkTheme => _swithToDarkTheme;
}
