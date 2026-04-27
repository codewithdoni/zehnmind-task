///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'translations.g.dart';

// Path: <root>
class TranslationsUzCyrl extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsUzCyrl({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.uzCyrl,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <uz-Cyrl>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsUzCyrl _root = this; // ignore: unused_field

	@override 
	TranslationsUzCyrl $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsUzCyrl(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsCommonUzCyrl common = _TranslationsCommonUzCyrl._(_root);
	@override late final _TranslationsErrorsUzCyrl errors = _TranslationsErrorsUzCyrl._(_root);
	@override late final _TranslationsOnboardingUzCyrl onboarding = _TranslationsOnboardingUzCyrl._(_root);
	@override late final _TranslationsAuthUzCyrl auth = _TranslationsAuthUzCyrl._(_root);
	@override late final _TranslationsHomeUzCyrl home = _TranslationsHomeUzCyrl._(_root);
	@override late final _TranslationsProfileUzCyrl profile = _TranslationsProfileUzCyrl._(_root);
}

// Path: common
class _TranslationsCommonUzCyrl extends TranslationsCommonUz {
	_TranslationsCommonUzCyrl._(TranslationsUzCyrl root) : this._root = root, super.internal(root);

	final TranslationsUzCyrl _root; // ignore: unused_field

	// Translations
	@override String get ok => 'ОК';
	@override String get cancel => 'Бекор қилиш';
	@override String get save => 'Сақлаш';
	@override String get delete => 'Ўчириш';
	@override String get edit => 'Таҳрирлаш';
	@override String get retry => 'Қайта уриниш';
	@override String get loading => 'Юкланмоқда...';
	@override String get logout => 'Чиқиш';
	@override String get logout_confirm => 'Ҳисобдан чиқишни хоҳлайсизми?';
	@override String get yes => 'Ҳа';
	@override String get no => 'Йўқ';
}

// Path: errors
class _TranslationsErrorsUzCyrl extends TranslationsErrorsUz {
	_TranslationsErrorsUzCyrl._(TranslationsUzCyrl root) : this._root = root, super.internal(root);

	final TranslationsUzCyrl _root; // ignore: unused_field

	// Translations
	@override String get something_went_wrong => 'Хатолик юз берди';
	@override String get no_internet => 'Интернет алоқаси йўқ';
	@override String get invalid_credentials => 'Email ёки парол нотўғри';
	@override String get weak_password => 'Парол жуда қисқа (камида 6 та белги)';
	@override String get email_in_use => 'Бу email аллақачон рўйхатдан ўтган';
	@override String get invalid_email => 'Email формати нотўғри';
	@override String get user_not_found => 'Фойдаланувчи топилмади';
	@override String get invalid_otp => 'СМС код нотўғри';
	@override String get google_sign_in_failed => 'Google билан кириш бекор қилинди';
}

// Path: onboarding
class _TranslationsOnboardingUzCyrl extends TranslationsOnboardingUz {
	_TranslationsOnboardingUzCyrl._(TranslationsUzCyrl root) : this._root = root, super.internal(root);

	final TranslationsUzCyrl _root; // ignore: unused_field

	// Translations
	@override String get step1_title => 'Вазифаларингизни бошқаринг';
	@override String get step1_desc => 'Ҳаётингизни тартибга солинг — todoларни қўшинг ва тугаллаш билан давом этинг.';
	@override String get step2_title => 'Ҳамма жойда синхрон';
	@override String get step2_desc => 'Cloud орқали real-time синхронлаш — ҳар қандай қурилмадан киринг.';
	@override String get step3_title => 'Бошлаймиз!';
	@override String get step3_desc => 'Тез рўйхатдан ўтинг ва биринчи вазифангизни қўшинг.';
	@override String get skip => 'Ўтказиб юбориш';
	@override String get next => 'Кейинги';
	@override String get get_started => 'Бошлаш';
}

// Path: auth
class _TranslationsAuthUzCyrl extends TranslationsAuthUz {
	_TranslationsAuthUzCyrl._(TranslationsUzCyrl root) : this._root = root, super.internal(root);

	final TranslationsUzCyrl _root; // ignore: unused_field

	// Translations
	@override String get login => 'Кириш';
	@override String get register => 'Рўйхатдан ўтиш';
	@override String get register_subtitle => 'Янги ҳисоб яратинг';
	@override String get login_subtitle => 'Ҳисобингизга киринг';
	@override String get full_name => 'Тўлиқ исм';
	@override String get email => 'Email';
	@override String get password => 'Парол';
	@override String get phone => 'Телефон рақам';
	@override String get or_continue_with => 'ёки давом этинг';
	@override String get google => 'Google';
	@override String get by_email => 'Email орқали';
	@override String get by_phone => 'Телефон орқали';
	@override String get no_account => 'Ҳисобингиз йўқми?';
	@override String get have_account => 'Ҳисобингиз борми?';
	@override String get send_code => 'Код юбориш';
	@override String get verify => 'Тасдиқлаш';
	@override String get otp_title => 'СМС кодни киритинг';
	@override String get otp_subtitle => '{phone} рақамига 6 рақамли код юборилди';
	@override String get resend_in => 'Қайта юбориш ({seconds}с)';
	@override String get resend_now => 'Қайта юбориш';
}

// Path: home
class _TranslationsHomeUzCyrl extends TranslationsHomeUz {
	_TranslationsHomeUzCyrl._(TranslationsUzCyrl root) : this._root = root, super.internal(root);

	final TranslationsUzCyrl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Менинг вазифаларим';
	@override String get empty => 'Ҳали вазифа йўқ. + тугмасини босинг!';
	@override String get add_task => 'Янги вазифа';
	@override String get edit_task => 'Вазифани таҳрирлаш';
	@override String get task_title => 'Сарлавҳа';
	@override String get task_description => 'Тавсиф (ихтиёрий)';
	@override String get add => 'Қўшиш';
	@override String get completed_count => '{done}/{total} бажарилди';
}

// Path: profile
class _TranslationsProfileUzCyrl extends TranslationsProfileUz {
	_TranslationsProfileUzCyrl._(TranslationsUzCyrl root) : this._root = root, super.internal(root);

	final TranslationsUzCyrl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Профиль';
	@override String get name => 'Исм';
	@override String get email => 'Email';
	@override String get phone => 'Телефон';
	@override String get joined => 'Қўшилган сана';
	@override String get edit_profile => 'Профилни таҳрирлаш';
	@override String get share_contact => 'Контактни улашиш';
	@override String get export_pdf => 'PDF экспорт';
	@override String get edit_title => 'Профилни таҳрирлаш';
	@override String get save_changes => 'Ўзгаришларни сақлаш';
}

/// The flat map containing all translations for locale <uz-Cyrl>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsUzCyrl {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'common.ok' => 'ОК',
			'common.cancel' => 'Бекор қилиш',
			'common.save' => 'Сақлаш',
			'common.delete' => 'Ўчириш',
			'common.edit' => 'Таҳрирлаш',
			'common.retry' => 'Қайта уриниш',
			'common.loading' => 'Юкланмоқда...',
			'common.logout' => 'Чиқиш',
			'common.logout_confirm' => 'Ҳисобдан чиқишни хоҳлайсизми?',
			'common.yes' => 'Ҳа',
			'common.no' => 'Йўқ',
			'errors.something_went_wrong' => 'Хатолик юз берди',
			'errors.no_internet' => 'Интернет алоқаси йўқ',
			'errors.invalid_credentials' => 'Email ёки парол нотўғри',
			'errors.weak_password' => 'Парол жуда қисқа (камида 6 та белги)',
			'errors.email_in_use' => 'Бу email аллақачон рўйхатдан ўтган',
			'errors.invalid_email' => 'Email формати нотўғри',
			'errors.user_not_found' => 'Фойдаланувчи топилмади',
			'errors.invalid_otp' => 'СМС код нотўғри',
			'errors.google_sign_in_failed' => 'Google билан кириш бекор қилинди',
			'onboarding.step1_title' => 'Вазифаларингизни бошқаринг',
			'onboarding.step1_desc' => 'Ҳаётингизни тартибга солинг — todoларни қўшинг ва тугаллаш билан давом этинг.',
			'onboarding.step2_title' => 'Ҳамма жойда синхрон',
			'onboarding.step2_desc' => 'Cloud орқали real-time синхронлаш — ҳар қандай қурилмадан киринг.',
			'onboarding.step3_title' => 'Бошлаймиз!',
			'onboarding.step3_desc' => 'Тез рўйхатдан ўтинг ва биринчи вазифангизни қўшинг.',
			'onboarding.skip' => 'Ўтказиб юбориш',
			'onboarding.next' => 'Кейинги',
			'onboarding.get_started' => 'Бошлаш',
			'auth.login' => 'Кириш',
			'auth.register' => 'Рўйхатдан ўтиш',
			'auth.register_subtitle' => 'Янги ҳисоб яратинг',
			'auth.login_subtitle' => 'Ҳисобингизга киринг',
			'auth.full_name' => 'Тўлиқ исм',
			'auth.email' => 'Email',
			'auth.password' => 'Парол',
			'auth.phone' => 'Телефон рақам',
			'auth.or_continue_with' => 'ёки давом этинг',
			'auth.google' => 'Google',
			'auth.by_email' => 'Email орқали',
			'auth.by_phone' => 'Телефон орқали',
			'auth.no_account' => 'Ҳисобингиз йўқми?',
			'auth.have_account' => 'Ҳисобингиз борми?',
			'auth.send_code' => 'Код юбориш',
			'auth.verify' => 'Тасдиқлаш',
			'auth.otp_title' => 'СМС кодни киритинг',
			'auth.otp_subtitle' => '{phone} рақамига 6 рақамли код юборилди',
			'auth.resend_in' => 'Қайта юбориш ({seconds}с)',
			'auth.resend_now' => 'Қайта юбориш',
			'home.title' => 'Менинг вазифаларим',
			'home.empty' => 'Ҳали вазифа йўқ. + тугмасини босинг!',
			'home.add_task' => 'Янги вазифа',
			'home.edit_task' => 'Вазифани таҳрирлаш',
			'home.task_title' => 'Сарлавҳа',
			'home.task_description' => 'Тавсиф (ихтиёрий)',
			'home.add' => 'Қўшиш',
			'home.completed_count' => '{done}/{total} бажарилди',
			'profile.title' => 'Профиль',
			'profile.name' => 'Исм',
			'profile.email' => 'Email',
			'profile.phone' => 'Телефон',
			'profile.joined' => 'Қўшилган сана',
			'profile.edit_profile' => 'Профилни таҳрирлаш',
			'profile.share_contact' => 'Контактни улашиш',
			'profile.export_pdf' => 'PDF экспорт',
			'profile.edit_title' => 'Профилни таҳрирлаш',
			'profile.save_changes' => 'Ўзгаришларни сақлаш',
			_ => null,
		};
	}
}
