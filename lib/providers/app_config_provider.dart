import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier {
  String applang = 'en';
  ThemeMode appThem = ThemeMode.light;

  void chengeLang(String langcode) {
    if (applang == langcode) {
      return;
    } else {
      applang = langcode;
      notifyListeners();
    }
  }

  void chengeTheme(ThemeMode newMode) {
    if (appThem == newMode) {
      return;
    } else {
      appThem = newMode;
      notifyListeners();
    }
  }
}
