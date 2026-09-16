// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get personalizeTitle => 'خصّص تجربتك';

  @override
  String get personalizeDescription =>
      'اختر المظهر واللغة المفضلة لديك للبدء بتجربة مريحة ومخصصة تناسب أسلوبك.';

  @override
  String get language => 'اللغة';

  @override
  String get english => 'الإنجليزية';

  @override
  String get arabic => 'العربية';

  @override
  String get theme => 'المظهر';

  @override
  String get letsStart => 'لنبدأ';
}
