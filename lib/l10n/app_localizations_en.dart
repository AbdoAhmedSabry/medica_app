// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get welcome => 'Welcome';

  @override
  String get signIn => 'Sign In';

  @override
  String get signInSubtitle =>
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.';

  @override
  String get emailLabel => 'Email';

  @override
  String get emailHint => 'Enter Your Email';

  @override
  String get passwordLabel => 'Password';

  @override
  String get passwordHint => 'Enter Your Password';

  @override
  String get forgetPassword => 'Forget Password';

  @override
  String get or => 'OR';

  @override
  String get dontHaveAccount => 'Don\'t have an account?';

  @override
  String get signUp => 'Sign Up';

  @override
  String get createNewAccount => 'Create New Account';

  @override
  String get fullNameLabel => 'Full Name';

  @override
  String get fullNameHint => 'Enter Your Full Name';

  @override
  String get mobileNumberLabel => 'Mobile Number';

  @override
  String get mobileNumberHint => 'Enter Your Phone Number';

  @override
  String get alreadyHaveAccount => 'Already have an account?';

  @override
  String get hiWelcomeBack => 'Hi, Welcome Back,';

  @override
  String get searchDoctorHint => 'Search a Doctor';

  @override
  String get medicalCenter => 'Medical Center';

  @override
  String get medicalCenterDesc =>
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.';

  @override
  String get categories => 'Categories';

  @override
  String get seeAll => 'See All';

  @override
  String get dentist => 'Dentist';

  @override
  String get therapist => 'Therapist';

  @override
  String get surgeon => 'Surgeon';

  @override
  String get allDoctors => 'All Doctors';

  @override
  String get bookNow => 'Book';
}
