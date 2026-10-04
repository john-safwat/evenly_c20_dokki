import 'package:evently_c20_dokki/core/theme/app_colors.dart';
import 'package:evently_c20_dokki/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfig extends ChangeNotifier {
  ThemeData get lightAppTheme => AppTheme(LightAppColors()).theme;

  ThemeData get darkAppTheme => AppTheme(DarkAppColors()).theme;
  ThemeMode themeMode;
  String locale;

  AppConfig(this.locale, this.themeMode);

  Future<void> changeTheme(ThemeMode theme) async {
    themeMode = theme;
    notifyListeners();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("theme", theme == ThemeMode.light);
  }

  Future<void> changeLocale(String lang) async {
    locale = lang;
    notifyListeners();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("locale", lang);
  }

  bool get isDarkMode => themeMode == ThemeMode.dark;
  bool get isEn => locale == "en";
}
