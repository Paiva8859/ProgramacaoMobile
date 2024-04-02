import 'package:shared_preferences/shared_preferences.dart';

class SettingsManager {
  static const _keyTheme = 'theme';
  static const _keyFontSize = 'font_size';

  Future<void> saveTheme(String theme) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyTheme, theme);
  }

  Future<String?> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyTheme);
  }

  Future<void> saveFontSize(double fontSize) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_keyFontSize, fontSize);
  }

  Future<double?> getFontSize() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(_keyFontSize);
  }
}
