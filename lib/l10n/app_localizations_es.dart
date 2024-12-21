import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get loginTitle => 'Todos App';

  @override
  String get emailInputLabel => 'Correo electrónico';

  @override
  String get passwordInputLabel => 'Contraseña';

  @override
  String get loginButtonText => 'Ingresar';

  @override
  String get loginCreateAccountText => 'Crear cuenta';

  @override
  String get registerScreenTitle => 'Registrarse';

  @override
  String get confirmPasswordInputLabel => 'Confirmar contraseña';

  @override
  String get registerScreenButtonText => 'Crear cuenta';
}
