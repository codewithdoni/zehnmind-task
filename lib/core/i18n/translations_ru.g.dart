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
class TranslationsRu extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsRu({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ru,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ru>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsRu _root = this; // ignore: unused_field

	@override 
	TranslationsRu $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsRu(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsCommonRu common = _TranslationsCommonRu._(_root);
	@override late final _TranslationsErrorsRu errors = _TranslationsErrorsRu._(_root);
	@override late final _TranslationsOnboardingRu onboarding = _TranslationsOnboardingRu._(_root);
	@override late final _TranslationsAuthRu auth = _TranslationsAuthRu._(_root);
	@override late final _TranslationsHomeRu home = _TranslationsHomeRu._(_root);
	@override late final _TranslationsProfileRu profile = _TranslationsProfileRu._(_root);
}

// Path: common
class _TranslationsCommonRu extends TranslationsCommonUz {
	_TranslationsCommonRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get ok => 'ОК';
	@override String get cancel => 'Отмена';
	@override String get save => 'Сохранить';
	@override String get delete => 'Удалить';
	@override String get edit => 'Редактировать';
	@override String get retry => 'Повторить';
	@override String get loading => 'Загрузка...';
	@override String get logout => 'Выйти';
	@override String get logout_confirm => 'Вы хотите выйти из аккаунта?';
	@override String get yes => 'Да';
	@override String get no => 'Нет';
}

// Path: errors
class _TranslationsErrorsRu extends TranslationsErrorsUz {
	_TranslationsErrorsRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get something_went_wrong => 'Произошла ошибка';
	@override String get no_internet => 'Нет интернет соединения';
	@override String get invalid_credentials => 'Неверный email или пароль';
	@override String get weak_password => 'Пароль слишком короткий (минимум 6 символов)';
	@override String get email_in_use => 'Этот email уже зарегистрирован';
	@override String get invalid_email => 'Неверный формат email';
	@override String get user_not_found => 'Пользователь не найден';
	@override String get invalid_otp => 'Неверный SMS код';
	@override String get google_sign_in_failed => 'Вход через Google отменён';
}

// Path: onboarding
class _TranslationsOnboardingRu extends TranslationsOnboardingUz {
	_TranslationsOnboardingRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get step1_title => 'Управляйте задачами';
	@override String get step1_desc => 'Организуйте свою жизнь — добавляйте задачи и отмечайте выполненные.';
	@override String get step2_title => 'Синхронизация везде';
	@override String get step2_desc => 'Реалтайм синхронизация через cloud — заходите с любого устройства.';
	@override String get step3_title => 'Начнём!';
	@override String get step3_desc => 'Быстро зарегистрируйтесь и добавьте первую задачу.';
	@override String get skip => 'Пропустить';
	@override String get next => 'Далее';
	@override String get get_started => 'Начать';
}

// Path: auth
class _TranslationsAuthRu extends TranslationsAuthUz {
	_TranslationsAuthRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get login => 'Войти';
	@override String get register => 'Регистрация';
	@override String get register_subtitle => 'Создайте новый аккаунт';
	@override String get login_subtitle => 'Войдите в свой аккаунт';
	@override String get full_name => 'Полное имя';
	@override String get email => 'Email';
	@override String get password => 'Пароль';
	@override String get phone => 'Номер телефона';
	@override String get or_continue_with => 'или продолжите';
	@override String get google => 'Google';
	@override String get by_email => 'По Email';
	@override String get by_phone => 'По телефону';
	@override String get no_account => 'Нет аккаунта?';
	@override String get have_account => 'Есть аккаунт?';
	@override String get send_code => 'Отправить код';
	@override String get verify => 'Подтвердить';
	@override String get otp_title => 'Введите SMS код';
	@override String get otp_subtitle => 'На {phone} отправлен 6-значный код';
	@override String get resend_in => 'Отправить снова ({seconds}с)';
	@override String get resend_now => 'Отправить снова';
}

// Path: home
class _TranslationsHomeRu extends TranslationsHomeUz {
	_TranslationsHomeRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Мои задачи';
	@override String get empty => 'Пока нет задач. Нажмите +!';
	@override String get add_task => 'Новая задача';
	@override String get edit_task => 'Редактировать задачу';
	@override String get task_title => 'Заголовок';
	@override String get task_description => 'Описание (опционально)';
	@override String get add => 'Добавить';
	@override String get completed_count => '{done}/{total} выполнено';
}

// Path: profile
class _TranslationsProfileRu extends TranslationsProfileUz {
	_TranslationsProfileRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Профиль';
	@override String get name => 'Имя';
	@override String get email => 'Email';
	@override String get phone => 'Телефон';
	@override String get joined => 'Дата регистрации';
	@override String get edit_profile => 'Редактировать профиль';
	@override String get share_contact => 'Поделиться контактом';
	@override String get export_pdf => 'PDF экспорт';
	@override String get edit_title => 'Редактировать профиль';
	@override String get save_changes => 'Сохранить изменения';
}

/// The flat map containing all translations for locale <ru>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsRu {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'common.ok' => 'ОК',
			'common.cancel' => 'Отмена',
			'common.save' => 'Сохранить',
			'common.delete' => 'Удалить',
			'common.edit' => 'Редактировать',
			'common.retry' => 'Повторить',
			'common.loading' => 'Загрузка...',
			'common.logout' => 'Выйти',
			'common.logout_confirm' => 'Вы хотите выйти из аккаунта?',
			'common.yes' => 'Да',
			'common.no' => 'Нет',
			'errors.something_went_wrong' => 'Произошла ошибка',
			'errors.no_internet' => 'Нет интернет соединения',
			'errors.invalid_credentials' => 'Неверный email или пароль',
			'errors.weak_password' => 'Пароль слишком короткий (минимум 6 символов)',
			'errors.email_in_use' => 'Этот email уже зарегистрирован',
			'errors.invalid_email' => 'Неверный формат email',
			'errors.user_not_found' => 'Пользователь не найден',
			'errors.invalid_otp' => 'Неверный SMS код',
			'errors.google_sign_in_failed' => 'Вход через Google отменён',
			'onboarding.step1_title' => 'Управляйте задачами',
			'onboarding.step1_desc' => 'Организуйте свою жизнь — добавляйте задачи и отмечайте выполненные.',
			'onboarding.step2_title' => 'Синхронизация везде',
			'onboarding.step2_desc' => 'Реалтайм синхронизация через cloud — заходите с любого устройства.',
			'onboarding.step3_title' => 'Начнём!',
			'onboarding.step3_desc' => 'Быстро зарегистрируйтесь и добавьте первую задачу.',
			'onboarding.skip' => 'Пропустить',
			'onboarding.next' => 'Далее',
			'onboarding.get_started' => 'Начать',
			'auth.login' => 'Войти',
			'auth.register' => 'Регистрация',
			'auth.register_subtitle' => 'Создайте новый аккаунт',
			'auth.login_subtitle' => 'Войдите в свой аккаунт',
			'auth.full_name' => 'Полное имя',
			'auth.email' => 'Email',
			'auth.password' => 'Пароль',
			'auth.phone' => 'Номер телефона',
			'auth.or_continue_with' => 'или продолжите',
			'auth.google' => 'Google',
			'auth.by_email' => 'По Email',
			'auth.by_phone' => 'По телефону',
			'auth.no_account' => 'Нет аккаунта?',
			'auth.have_account' => 'Есть аккаунт?',
			'auth.send_code' => 'Отправить код',
			'auth.verify' => 'Подтвердить',
			'auth.otp_title' => 'Введите SMS код',
			'auth.otp_subtitle' => 'На {phone} отправлен 6-значный код',
			'auth.resend_in' => 'Отправить снова ({seconds}с)',
			'auth.resend_now' => 'Отправить снова',
			'home.title' => 'Мои задачи',
			'home.empty' => 'Пока нет задач. Нажмите +!',
			'home.add_task' => 'Новая задача',
			'home.edit_task' => 'Редактировать задачу',
			'home.task_title' => 'Заголовок',
			'home.task_description' => 'Описание (опционально)',
			'home.add' => 'Добавить',
			'home.completed_count' => '{done}/{total} выполнено',
			'profile.title' => 'Профиль',
			'profile.name' => 'Имя',
			'profile.email' => 'Email',
			'profile.phone' => 'Телефон',
			'profile.joined' => 'Дата регистрации',
			'profile.edit_profile' => 'Редактировать профиль',
			'profile.share_contact' => 'Поделиться контактом',
			'profile.export_pdf' => 'PDF экспорт',
			'profile.edit_title' => 'Редактировать профиль',
			'profile.save_changes' => 'Сохранить изменения',
			_ => null,
		};
	}
}
