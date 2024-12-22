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

  @override
  String get registerAccountCreatedSuccess => 'Cuenta creada con éxito!';

  @override
  String get alertPasswordsDifferent => 'Contraseñas diferentes';

  @override
  String get homeOptionNavBar => 'Inicio';

  @override
  String get profileOptionNavBar => 'Perfil';

  @override
  String get taskListOptionNavBar => 'Listado de tareas';

  @override
  String get homeScreenTitle => 'Bienvenido ';

  @override
  String get homeScreenTaskList => 'Tareas pendientes';

  @override
  String get taskStatusPending => 'Pendiente';

  @override
  String get taskStatusCompleted => 'Completado';

  @override
  String get cardUserId => 'Usuario ID: ';

  @override
  String get saveButtonTaskDetailScreen => 'Guardar';

  @override
  String get deleteButtonTaskDetailScreen => 'Eliminar';

  @override
  String get idTaskDetailScreen => 'ID: ';

  @override
  String get titleTaskDetailScreen => 'Título';

  @override
  String get descriptionTaskDetailScreen => 'Descripción';

  @override
  String get completedTaskDetailScreen => 'Tarea completada';

  @override
  String get taskActionTaskDetailScreen => 'Acción realizada exitosamente!';

  @override
  String get taskDeletedMessage => 'Tarea eliminada exitosamente!';

  @override
  String get taskCreatedMessage => 'Tarea creada exitosamente';

  @override
  String get confirmDeleteTitle => 'Confirmación';

  @override
  String get confirmDeleteMessage => '¿Estás seguro que quieres eliminar la tarea?';

  @override
  String get cancelButton => 'Cancelar';

  @override
  String get confirmButton => 'Confirmar';
}
