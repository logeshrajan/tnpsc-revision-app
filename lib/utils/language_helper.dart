import 'package:shared_preferences/shared_preferences.dart';

class LanguageHelper {
  static const String _languageKey = 'selected_language';
  static const String _englishCode = 'en';
  static const String _tamilCode = 'ta';
  
  // Language codes
  static const String english = _englishCode;
  static const String tamil = _tamilCode;
  
  // Get current language
  static Future<String> getCurrentLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_languageKey) ?? _englishCode;
  }
  
  // Set language
  static Future<void> setLanguage(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, languageCode);
  }
  
  // Check if current language is Tamil
  static Future<bool> isTamil() async {
    final currentLang = await getCurrentLanguage();
    return currentLang == _tamilCode;
  }
  
  // Check if current language is English
  static Future<bool> isEnglish() async {
    final currentLang = await getCurrentLanguage();
    return currentLang == _englishCode;
  }
  
  // Get language name for display
  static String getLanguageDisplayName(String languageCode) {
    switch (languageCode) {
      case _englishCode:
        return 'English';
      case _tamilCode:
        return 'தமிழ்';
      default:
        return 'English';
    }
  }
  
  // Get available languages
  static List<Map<String, String>> getAvailableLanguages() {
    return [
      {'code': _englishCode, 'name': 'English'},
      {'code': _tamilCode, 'name': 'தமிழ்'},
    ];
  }
  
  // Toggle between languages
  static Future<void> toggleLanguage() async {
    final currentLang = await getCurrentLanguage();
    final newLang = currentLang == _englishCode ? _tamilCode : _englishCode;
    await setLanguage(newLang);
  }
  
  // Validate language code
  static bool isValidLanguageCode(String languageCode) {
    return [_englishCode, _tamilCode].contains(languageCode);
  }
}
