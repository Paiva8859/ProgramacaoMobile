import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MyThemePreferences with ChangeNotifier {
  static const THEME_KEY = "theme_key";

  Future<void> setTheme(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool(THEME_KEY, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(THEME_KEY) ?? false;
  }
}
