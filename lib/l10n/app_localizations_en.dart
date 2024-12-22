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

  @override
  String get homeOptionNavBar => 'Home';

  @override
  String get profileOptionNavBar => 'Profile';

  @override
  String get taskListOptionNavBar => 'Tasks list';

  @override
  String get homeScreenTitle => 'Welcome ';

  @override
  String get homeScreenTaskList => 'Pending tasks';

  @override
  String get taskStatusPending => 'Pending';

  @override
  String get taskStatusCompleted => 'Completed';

  @override
  String get cardUserId => 'User ID: ';

  @override
  String get saveButtonTaskDetailScreen => 'Save';

  @override
  String get deleteButtonTaskDetailScreen => 'Eliminar';

  @override
  String get idTaskDetailScreen => 'ID: ';

  @override
  String get titleTaskDetailScreen => 'Title';

  @override
  String get descriptionTaskDetailScreen => 'Description';

  @override
  String get completedTaskDetailScreen => 'Task completed';

  @override
  String get taskActionTaskDetailScreen => 'Action performed successfully!';

  @override
  String get taskDeletedMessage => 'Task deleted succesfully!';

  @override
  String get taskCreatedMessage => 'Task created succesfully!';

  @override
  String get confirmDeleteTitle => 'Alert';

  @override
  String get confirmDeleteMessage => '¿Are you sure you want to delete the task??';

  @override
  String get cancelButton => 'Cancel';

  @override
  String get confirmButton => 'Confirm';
}
