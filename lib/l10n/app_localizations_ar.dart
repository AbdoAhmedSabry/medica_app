// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get welcome => 'مرحباً';

  @override
  String get signIn => 'تسجيل الدخول';

  @override
  String get signInSubtitle =>
      'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة.';

  @override
  String get emailLabel => 'البريد الإلكتروني';

  @override
  String get emailHint => 'أدخل بريدك الإلكتروني';

  @override
  String get passwordLabel => 'كلمة المرور';

  @override
  String get passwordHint => 'أدخل كلمة المرور';

  @override
  String get forgetPassword => 'نسيت كلمة المرور؟';

  @override
  String get or => 'أو';

  @override
  String get dontHaveAccount => 'ليس لديك حساب؟';

  @override
  String get signUp => 'إنشاء حساب';

  @override
  String get createNewAccount => 'إنشاء حساب جديد';

  @override
  String get fullNameLabel => 'الاسم الكامل';

  @override
  String get fullNameHint => 'أدخل اسمك بالكامل';

  @override
  String get mobileNumberLabel => 'رقم الهاتف';

  @override
  String get mobileNumberHint => 'أدخل رقم هاتفك';

  @override
  String get alreadyHaveAccount => 'لديك حساب بالفعل؟';

  @override
  String get hiWelcomeBack => 'مرحباً بعودتك،';

  @override
  String get searchDoctorHint => 'ابحث عن طبيب...';

  @override
  String get medicalCenter => 'المركز الطبي';

  @override
  String get medicalCenterDesc =>
      'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة.';

  @override
  String get categories => 'التخصصات';

  @override
  String get seeAll => 'عرض الكل';

  @override
  String get dentist => 'أسنان';

  @override
  String get therapist => 'علاج طبيعي';

  @override
  String get surgeon => 'جراحة';

  @override
  String get allDoctors => 'جميع الأطباء';

  @override
  String get bookNow => 'احجز';
}
