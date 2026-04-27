import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zehnmind/core/i18n/translations.g.dart';

@lazySingleton
class LanguageService {
  LanguageService(this._prefs);

  static const _key = 'app_locale';

  final SharedPreferences _prefs;

  Future<void> initializeLanguage() async {
    final stored = _prefs.getString(_key);
    if (stored != null) {
      final locale = AppLocaleUtils.parse(stored);
      LocaleSettings.setLocale(locale);
    } else {
      LocaleSettings.useDeviceLocale();
    }
  }

  Future<void> setLocale(AppLocale locale) async {
    LocaleSettings.setLocale(locale);
    await _prefs.setString(_key, locale.languageTag);
  }

  AppLocale get currentLocale => LocaleSettings.currentLocale;
}
