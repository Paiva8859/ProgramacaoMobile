import 'package:shared_preferences/shared_preferences.dart';

class SettingsManager {
  static const _keyThemePrefix = 'theme_';
  static const _keyFontSizePrefix = 'font_size_';

  Future<void> saveTheme(String username, String theme) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyThemePrefix + username, theme);
  }

  Future<String?> getTheme(String username) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyThemePrefix + username);
  }

  Future<void> saveFontSize(String username, double fontSize) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_keyFontSizePrefix + username, fontSize);
  }

  Future<double?> getFontSize(String username) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(_keyFontSizePrefix + username);
  }
}
