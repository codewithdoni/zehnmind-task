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
      try {
        final locale = AppLocaleUtils.parse(stored);
        LocaleSettings.setLocale(locale);
        return;
      } catch (_) {
        // fall through to device locale
      }
    }
    LocaleSettings.useDeviceLocale();
  }

  Future<void> setLocale(AppLocale locale) async {
    LocaleSettings.setLocale(locale);
    await _prefs.setString(_key, locale.languageTag);
  }

  AppLocale get currentLocale => LocaleSettings.currentLocale;

  List<AppLocale> get availableLocales => const [
    AppLocale.uz,
    AppLocale.uzCyrl,
    AppLocale.ru,
  ];

  String displayName(AppLocale locale) => switch (locale) {
    AppLocale.uz => "O'zbekcha",
    AppLocale.uzCyrl => 'Ўзбекча',
    AppLocale.ru => 'Русский',
  };

  String flag(AppLocale locale) => switch (locale) {
    AppLocale.uz => '🇺🇿',
    AppLocale.uzCyrl => '🇺🇿',
    AppLocale.ru => '🇷🇺',
  };
}
