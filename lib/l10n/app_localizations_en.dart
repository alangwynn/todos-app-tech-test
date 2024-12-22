import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get loginTitle => 'Todos App';

  @override
  String get emailInputLabel => 'Email';

  @override
  String get passwordInputLabel => 'Password';

  @override
  String get loginButtonText => 'Log in';

  @override
  String get loginCreateAccountText => 'Create account';

  @override
  String get registerScreenTitle => 'Sign up';

  @override
  String get confirmPasswordInputLabel => 'Confirm password';

  @override
  String get registerScreenButtonText => 'Create account';

  @override
  String get registerAccountCreatedSuccess => 'Account created successfully!';

  @override
  String get alertPasswordsDifferent => 'Different passwords';
}
