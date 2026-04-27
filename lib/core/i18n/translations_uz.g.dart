///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'translations.g.dart';

// Path: <root>
typedef TranslationsUz = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.uz,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <uz>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final TranslationsCommonUz common = TranslationsCommonUz.internal(_root);
	late final TranslationsErrorsUz errors = TranslationsErrorsUz.internal(_root);
	late final TranslationsOnboardingUz onboarding = TranslationsOnboardingUz.internal(_root);
	late final TranslationsAuthUz auth = TranslationsAuthUz.internal(_root);
	late final TranslationsHomeUz home = TranslationsHomeUz.internal(_root);
	late final TranslationsProfileUz profile = TranslationsProfileUz.internal(_root);
}

// Path: common
class TranslationsCommonUz {
	TranslationsCommonUz.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// uz: 'OK'
	String get ok => 'OK';

	/// uz: 'Bekor qilish'
	String get cancel => 'Bekor qilish';

	/// uz: 'Saqlash'
	String get save => 'Saqlash';

	/// uz: 'O'chirish'
	String get delete => 'O\'chirish';

	/// uz: 'Tahrirlash'
	String get edit => 'Tahrirlash';

	/// uz: 'Qayta urinish'
	String get retry => 'Qayta urinish';

	/// uz: 'Yuklanmoqda...'
	String get loading => 'Yuklanmoqda...';

	/// uz: 'Chiqish'
	String get logout => 'Chiqish';

	/// uz: 'Hisobdan chiqishni xohlaysizmi?'
	String get logout_confirm => 'Hisobdan chiqishni xohlaysizmi?';

	/// uz: 'Ha'
	String get yes => 'Ha';

	/// uz: 'Yo'q'
	String get no => 'Yo\'q';
}

// Path: errors
class TranslationsErrorsUz {
	TranslationsErrorsUz.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// uz: 'Xatolik yuz berdi'
	String get something_went_wrong => 'Xatolik yuz berdi';

	/// uz: 'Internet aloqasi yo'q'
	String get no_internet => 'Internet aloqasi yo\'q';

	/// uz: 'Email yoki parol noto'g'ri'
	String get invalid_credentials => 'Email yoki parol noto\'g\'ri';

	/// uz: 'Parol juda qisqa (kamida 6 ta belgi)'
	String get weak_password => 'Parol juda qisqa (kamida 6 ta belgi)';

	/// uz: 'Bu email allaqachon ro'yxatdan o'tgan'
	String get email_in_use => 'Bu email allaqachon ro\'yxatdan o\'tgan';

	/// uz: 'Email format noto'g'ri'
	String get invalid_email => 'Email format noto\'g\'ri';

	/// uz: 'Foydalanuvchi topilmadi'
	String get user_not_found => 'Foydalanuvchi topilmadi';

	/// uz: 'SMS kod noto'g'ri'
	String get invalid_otp => 'SMS kod noto\'g\'ri';

	/// uz: 'Google bilan kirish bekor qilindi'
	String get google_sign_in_failed => 'Google bilan kirish bekor qilindi';
}

// Path: onboarding
class TranslationsOnboardingUz {
	TranslationsOnboardingUz.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// uz: 'Vazifalaringizni boshqaring'
	String get step1_title => 'Vazifalaringizni boshqaring';

	/// uz: 'Hayotingizni tartibga soling — todo'larni qo'shing va tugallash bilan davom eting.'
	String get step1_desc => 'Hayotingizni tartibga soling — todo\'larni qo\'shing va tugallash bilan davom eting.';

	/// uz: 'Hamma joyda sinxron'
	String get step2_title => 'Hamma joyda sinxron';

	/// uz: 'Cloud orqali real-time sinxronlash — har qanday qurilmadan kiring.'
	String get step2_desc => 'Cloud orqali real-time sinxronlash — har qanday qurilmadan kiring.';

	/// uz: 'Boshlaymiz!'
	String get step3_title => 'Boshlaymiz!';

	/// uz: 'Tez ro'yxatdan o'ting va birinchi vazifangizni qo'shing.'
	String get step3_desc => 'Tez ro\'yxatdan o\'ting va birinchi vazifangizni qo\'shing.';

	/// uz: 'O'tkazib yuborish'
	String get skip => 'O\'tkazib yuborish';

	/// uz: 'Keyingi'
	String get next => 'Keyingi';

	/// uz: 'Boshlash'
	String get get_started => 'Boshlash';
}

// Path: auth
class TranslationsAuthUz {
	TranslationsAuthUz.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// uz: 'Kirish'
	String get login => 'Kirish';

	/// uz: 'Ro'yxatdan o'tish'
	String get register => 'Ro\'yxatdan o\'tish';

	/// uz: 'Yangi hisob yarating'
	String get register_subtitle => 'Yangi hisob yarating';

	/// uz: 'Hisobingizga kiring'
	String get login_subtitle => 'Hisobingizga kiring';

	/// uz: 'To'liq ism'
	String get full_name => 'To\'liq ism';

	/// uz: 'Email'
	String get email => 'Email';

	/// uz: 'Parol'
	String get password => 'Parol';

	/// uz: 'Telefon raqam'
	String get phone => 'Telefon raqam';

	/// uz: 'yoki davom eting'
	String get or_continue_with => 'yoki davom eting';

	/// uz: 'Google'
	String get google => 'Google';

	/// uz: 'Email orqali'
	String get by_email => 'Email orqali';

	/// uz: 'Telefon orqali'
	String get by_phone => 'Telefon orqali';

	/// uz: 'Hisobingiz yo'qmi?'
	String get no_account => 'Hisobingiz yo\'qmi?';

	/// uz: 'Hisobingiz bormi?'
	String get have_account => 'Hisobingiz bormi?';

	/// uz: 'Kod yuborish'
	String get send_code => 'Kod yuborish';

	/// uz: 'Tasdiqlash'
	String get verify => 'Tasdiqlash';

	/// uz: 'SMS kodni kiriting'
	String get otp_title => 'SMS kodni kiriting';

	/// uz: '{phone} raqamiga 6 raqamli kod yuborildi'
	String get otp_subtitle => '{phone} raqamiga 6 raqamli kod yuborildi';

	/// uz: 'Qayta yuborish ({seconds}s)'
	String get resend_in => 'Qayta yuborish ({seconds}s)';

	/// uz: 'Qayta yuborish'
	String get resend_now => 'Qayta yuborish';
}

// Path: home
class TranslationsHomeUz {
	TranslationsHomeUz.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// uz: 'Mening vazifalarim'
	String get title => 'Mening vazifalarim';

	/// uz: 'Hali vazifa yo'q. + tugmasini bosing!'
	String get empty => 'Hali vazifa yo\'q. + tugmasini bosing!';

	/// uz: 'Yangi vazifa'
	String get add_task => 'Yangi vazifa';

	/// uz: 'Vazifani tahrirlash'
	String get edit_task => 'Vazifani tahrirlash';

	/// uz: 'Sarlavha'
	String get task_title => 'Sarlavha';

	/// uz: 'Tavsif (ixtiyoriy)'
	String get task_description => 'Tavsif (ixtiyoriy)';

	/// uz: 'Qo'shish'
	String get add => 'Qo\'shish';

	/// uz: '{done}/{total} bajarildi'
	String get completed_count => '{done}/{total} bajarildi';
}

// Path: profile
class TranslationsProfileUz {
	TranslationsProfileUz.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// uz: 'Profil'
	String get title => 'Profil';

	/// uz: 'Ism'
	String get name => 'Ism';

	/// uz: 'Email'
	String get email => 'Email';

	/// uz: 'Telefon'
	String get phone => 'Telefon';

	/// uz: 'Qo'shilgan sana'
	String get joined => 'Qo\'shilgan sana';

	/// uz: 'Profilni tahrirlash'
	String get edit_profile => 'Profilni tahrirlash';

	/// uz: 'Kontaktni ulashish'
	String get share_contact => 'Kontaktni ulashish';

	/// uz: 'PDF eksport'
	String get export_pdf => 'PDF eksport';

	/// uz: 'Profilni tahrirlash'
	String get edit_title => 'Profilni tahrirlash';

	/// uz: 'O'zgarishlarni saqlash'
	String get save_changes => 'O\'zgarishlarni saqlash';
}

/// The flat map containing all translations for locale <uz>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'common.ok' => 'OK',
			'common.cancel' => 'Bekor qilish',
			'common.save' => 'Saqlash',
			'common.delete' => 'O\'chirish',
			'common.edit' => 'Tahrirlash',
			'common.retry' => 'Qayta urinish',
			'common.loading' => 'Yuklanmoqda...',
			'common.logout' => 'Chiqish',
			'common.logout_confirm' => 'Hisobdan chiqishni xohlaysizmi?',
			'common.yes' => 'Ha',
			'common.no' => 'Yo\'q',
			'errors.something_went_wrong' => 'Xatolik yuz berdi',
			'errors.no_internet' => 'Internet aloqasi yo\'q',
			'errors.invalid_credentials' => 'Email yoki parol noto\'g\'ri',
			'errors.weak_password' => 'Parol juda qisqa (kamida 6 ta belgi)',
			'errors.email_in_use' => 'Bu email allaqachon ro\'yxatdan o\'tgan',
			'errors.invalid_email' => 'Email format noto\'g\'ri',
			'errors.user_not_found' => 'Foydalanuvchi topilmadi',
			'errors.invalid_otp' => 'SMS kod noto\'g\'ri',
			'errors.google_sign_in_failed' => 'Google bilan kirish bekor qilindi',
			'onboarding.step1_title' => 'Vazifalaringizni boshqaring',
			'onboarding.step1_desc' => 'Hayotingizni tartibga soling — todo\'larni qo\'shing va tugallash bilan davom eting.',
			'onboarding.step2_title' => 'Hamma joyda sinxron',
			'onboarding.step2_desc' => 'Cloud orqali real-time sinxronlash — har qanday qurilmadan kiring.',
			'onboarding.step3_title' => 'Boshlaymiz!',
			'onboarding.step3_desc' => 'Tez ro\'yxatdan o\'ting va birinchi vazifangizni qo\'shing.',
			'onboarding.skip' => 'O\'tkazib yuborish',
			'onboarding.next' => 'Keyingi',
			'onboarding.get_started' => 'Boshlash',
			'auth.login' => 'Kirish',
			'auth.register' => 'Ro\'yxatdan o\'tish',
			'auth.register_subtitle' => 'Yangi hisob yarating',
			'auth.login_subtitle' => 'Hisobingizga kiring',
			'auth.full_name' => 'To\'liq ism',
			'auth.email' => 'Email',
			'auth.password' => 'Parol',
			'auth.phone' => 'Telefon raqam',
			'auth.or_continue_with' => 'yoki davom eting',
			'auth.google' => 'Google',
			'auth.by_email' => 'Email orqali',
			'auth.by_phone' => 'Telefon orqali',
			'auth.no_account' => 'Hisobingiz yo\'qmi?',
			'auth.have_account' => 'Hisobingiz bormi?',
			'auth.send_code' => 'Kod yuborish',
			'auth.verify' => 'Tasdiqlash',
			'auth.otp_title' => 'SMS kodni kiriting',
			'auth.otp_subtitle' => '{phone} raqamiga 6 raqamli kod yuborildi',
			'auth.resend_in' => 'Qayta yuborish ({seconds}s)',
			'auth.resend_now' => 'Qayta yuborish',
			'home.title' => 'Mening vazifalarim',
			'home.empty' => 'Hali vazifa yo\'q. + tugmasini bosing!',
			'home.add_task' => 'Yangi vazifa',
			'home.edit_task' => 'Vazifani tahrirlash',
			'home.task_title' => 'Sarlavha',
			'home.task_description' => 'Tavsif (ixtiyoriy)',
			'home.add' => 'Qo\'shish',
			'home.completed_count' => '{done}/{total} bajarildi',
			'profile.title' => 'Profil',
			'profile.name' => 'Ism',
			'profile.email' => 'Email',
			'profile.phone' => 'Telefon',
			'profile.joined' => 'Qo\'shilgan sana',
			'profile.edit_profile' => 'Profilni tahrirlash',
			'profile.share_contact' => 'Kontaktni ulashish',
			'profile.export_pdf' => 'PDF eksport',
			'profile.edit_title' => 'Profilni tahrirlash',
			'profile.save_changes' => 'O\'zgarishlarni saqlash',
			_ => null,
		};
	}
}
