import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es')
  ];

  /// No description provided for @loginTitle.
  ///
  /// In es, this message translates to:
  /// **'Todos App'**
  String get loginTitle;

  /// No description provided for @emailInputLabel.
  ///
  /// In es, this message translates to:
  /// **'Correo electrónico'**
  String get emailInputLabel;

  /// No description provided for @passwordInputLabel.
  ///
  /// In es, this message translates to:
  /// **'Contraseña'**
  String get passwordInputLabel;

  /// No description provided for @loginButtonText.
  ///
  /// In es, this message translates to:
  /// **'Ingresar'**
  String get loginButtonText;

  /// No description provided for @loginCreateAccountText.
  ///
  /// In es, this message translates to:
  /// **'Crear cuenta'**
  String get loginCreateAccountText;

  /// No description provided for @registerScreenTitle.
  ///
  /// In es, this message translates to:
  /// **'Registrarse'**
  String get registerScreenTitle;

  /// No description provided for @confirmPasswordInputLabel.
  ///
  /// In es, this message translates to:
  /// **'Confirmar contraseña'**
  String get confirmPasswordInputLabel;

  /// No description provided for @registerScreenButtonText.
  ///
  /// In es, this message translates to:
  /// **'Crear cuenta'**
  String get registerScreenButtonText;

  /// No description provided for @registerAccountCreatedSuccess.
  ///
  /// In es, this message translates to:
  /// **'Cuenta creada con éxito!'**
  String get registerAccountCreatedSuccess;

  /// No description provided for @alertPasswordsDifferent.
  ///
  /// In es, this message translates to:
  /// **'Contraseñas diferentes'**
  String get alertPasswordsDifferent;

  /// No description provided for @homeOptionNavBar.
  ///
  /// In es, this message translates to:
  /// **'Inicio'**
  String get homeOptionNavBar;

  /// No description provided for @profileOptionNavBar.
  ///
  /// In es, this message translates to:
  /// **'Perfil'**
  String get profileOptionNavBar;

  /// No description provided for @taskListOptionNavBar.
  ///
  /// In es, this message translates to:
  /// **'Listado de tareas'**
  String get taskListOptionNavBar;

  /// No description provided for @homeScreenTitle.
  ///
  /// In es, this message translates to:
  /// **'Bienvenido '**
  String get homeScreenTitle;

  /// No description provided for @homeScreenTaskList.
  ///
  /// In es, this message translates to:
  /// **'Tareas pendientes'**
  String get homeScreenTaskList;

  /// No description provided for @taskStatusPending.
  ///
  /// In es, this message translates to:
  /// **'Pendiente'**
  String get taskStatusPending;

  /// No description provided for @taskStatusCompleted.
  ///
  /// In es, this message translates to:
  /// **'Completado'**
  String get taskStatusCompleted;

  /// No description provided for @cardUserId.
  ///
  /// In es, this message translates to:
  /// **'Usuario ID: '**
  String get cardUserId;

  /// No description provided for @saveButtonTaskDetailScreen.
  ///
  /// In es, this message translates to:
  /// **'Guardar'**
  String get saveButtonTaskDetailScreen;

  /// No description provided for @deleteButtonTaskDetailScreen.
  ///
  /// In es, this message translates to:
  /// **'Eliminar'**
  String get deleteButtonTaskDetailScreen;

  /// No description provided for @idTaskDetailScreen.
  ///
  /// In es, this message translates to:
  /// **'ID: '**
  String get idTaskDetailScreen;

  /// No description provided for @titleTaskDetailScreen.
  ///
  /// In es, this message translates to:
  /// **'Título'**
  String get titleTaskDetailScreen;

  /// No description provided for @descriptionTaskDetailScreen.
  ///
  /// In es, this message translates to:
  /// **'Descripción'**
  String get descriptionTaskDetailScreen;

  /// No description provided for @completedTaskDetailScreen.
  ///
  /// In es, this message translates to:
  /// **'Tarea completada'**
  String get completedTaskDetailScreen;

  /// No description provided for @taskActionTaskDetailScreen.
  ///
  /// In es, this message translates to:
  /// **'Acción realizada exitosamente!'**
  String get taskActionTaskDetailScreen;

  /// No description provided for @taskDeletedMessage.
  ///
  /// In es, this message translates to:
  /// **'Tarea eliminada exitosamente!'**
  String get taskDeletedMessage;

  /// No description provided for @taskCreatedMessage.
  ///
  /// In es, this message translates to:
  /// **'Tarea creada exitosamente'**
  String get taskCreatedMessage;

  /// No description provided for @confirmDeleteTitle.
  ///
  /// In es, this message translates to:
  /// **'Confirmación'**
  String get confirmDeleteTitle;

  /// No description provided for @confirmDeleteMessage.
  ///
  /// In es, this message translates to:
  /// **'¿Estás seguro que quieres eliminar la tarea?'**
  String get confirmDeleteMessage;

  /// No description provided for @cancelButton.
  ///
  /// In es, this message translates to:
  /// **'Cancelar'**
  String get cancelButton;

  /// No description provided for @confirmButton.
  ///
  /// In es, this message translates to:
  /// **'Confirmar'**
  String get confirmButton;

  /// No description provided for @taskListOptionPending.
  ///
  /// In es, this message translates to:
  /// **'Pendientes'**
  String get taskListOptionPending;

  /// No description provided for @taskListOptionCompleted.
  ///
  /// In es, this message translates to:
  /// **'Completados'**
  String get taskListOptionCompleted;

  /// No description provided for @taskListOptionAll.
  ///
  /// In es, this message translates to:
  /// **'Todos'**
  String get taskListOptionAll;

  /// No description provided for @createTaskButton.
  ///
  /// In es, this message translates to:
  /// **'Crear tarea'**
  String get createTaskButton;

  /// No description provided for @createTaskScreenTitle.
  ///
  /// In es, this message translates to:
  /// **'Crea una nueva tarea'**
  String get createTaskScreenTitle;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
