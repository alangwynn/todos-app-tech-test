import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get loginTitle => 'Todos App';

  @override
  String get usernameInputLabel => 'Username';

  @override
  String get passwordInputLabel => 'Password';

  @override
  String get loginButtonText => 'Log in';
}
