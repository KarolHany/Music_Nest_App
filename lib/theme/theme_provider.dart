import 'package:flutter/material.dart';
import 'package:music_player/theme/dark_mode.dart';
import 'package:music_player/theme/light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightMood;

  ThemeData get themeData => _themeData;
  bool get isDark => _themeData == darkMood;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    _themeData = _themeData == darkMood ? lightMood : darkMood;
    notifyListeners();
  }
}
