// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get personalizeTitle => 'Personalize Your Experience';

  @override
  String get personalizeDescription =>
      'Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.';

  @override
  String get language => 'Language';

  @override
  String get english => 'English';

  @override
  String get arabic => 'Arabic';

  @override
  String get theme => 'Theme';

  @override
  String get letsStart => 'Let’s start';

  @override
  String get loginToYourAccount => 'Login to your account';

  @override
  String get createYourAccount => 'Create your account';

  @override
  String get forgetPasswordTitle => 'Forget Password';

  @override
  String get enterYourName => 'Enter your name';

  @override
  String get enterYourEmail => 'Enter your email';

  @override
  String get enterYourPassword => 'Enter your password';

  @override
  String get confirmYourPassword => 'Confirm your password';

  @override
  String get forgetPasswordQuestion => 'Forget Password?';

  @override
  String get login => 'Login';

  @override
  String get signUp => 'Sign up';

  @override
  String get dontHaveAccount => 'Don\'t have an account ?';

  @override
  String get alreadyHaveAccount => 'Already have an account?';

  @override
  String get or => 'Or';

  @override
  String get loginWithGoogle => 'Login with Google';

  @override
  String get signUpWithGoogle => 'Sign up with Google';

  @override
  String get resetPassword => 'Reset password';

  @override
  String get nameRequired => 'Name is required';

  @override
  String get invalidNameFormat =>
      'Please enter a valid name (letters and spaces only)';

  @override
  String get emailRequired => 'Email is required';

  @override
  String get invalidEmailFormat => 'Please enter a valid email address';

  @override
  String get passwordRequired => 'Password is required';

  @override
  String get passwordInvalid =>
      'Password must be at least 8 characters and include uppercase, lowercase, number, and special character';

  @override
  String get confirmPasswordRequired => 'Please confirm your password';

  @override
  String get passwordConfirmationMismatch => 'Passwords do not match';

  @override
  String get home => 'Home';

  @override
  String get favorite => 'Favorite';

  @override
  String get profile => 'Profile';
}
