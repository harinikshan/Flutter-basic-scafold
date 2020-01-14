import 'package:flutter/material.dart';

class ThemeChanger extends ChangeNotifier {
  final darkTheme = ThemeData.dark();
  final lightTheme = ThemeData.light().copyWith(
    tabBarTheme: TabBarTheme(
      labelColor: Colors.blue,
      unselectedLabelColor: Colors.blue[100],
    ),
  );
  bool _isDarkTheme;
  ThemeChanger(this._isDarkTheme);

  isDarkTheme() {
    return _isDarkTheme;
  }

  getThemeData() {
    return _isDarkTheme ? darkTheme : lightTheme;
  }

  isDarkThemeData(bool isDarkTheme) {
    _isDarkTheme = isDarkTheme;
    notifyListeners();
  }
}
