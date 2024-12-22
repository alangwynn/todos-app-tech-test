
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:technical_test_flutter_sr/features/home/domain/entities/entities.dart';
import 'package:technical_test_flutter_sr/features/home/presentation/providers/providers.dart';

part 'todos_state_notifier.g.dart';

@Riverpod(keepAlive: true)
class TodosStateNotifier extends _$TodosStateNotifier {

  @override
  FutureOr<List<TaskEntity>?> build() async {
    state = const AsyncLoading();
    final repository = ref.read(homeRepositoryProvider);
    final response = await repository.getTasks();

    return response.fold((error) {
      throw error;
    }, (data) {
      if (data == null) return [];
      return data;
    });
  }

  Future<void> getTodos() async {
    state = const AsyncLoading();

    final repository = ref.read(homeRepositoryProvider);
    final response = await repository.getTasks();

    response.fold((error) {
      state = AsyncError(
        error.message,
        error.stackTrace ?? StackTrace.current,
      );
    }, (data) {
      state = AsyncData(
        data ?? [],
      );
    });
  }

  Future<void> updateTask({
    required TaskEntity task,
  }) async {
    state = const AsyncLoading();

    final todos = state.value!;
    final index = todos.indexWhere((todo) => todo.id == task.id);
    
    final updatedTask = todos[index].copyWith(
      title: task.title,
      description: task.description,
      completed: task.completed,
    );
    
    todos[index] = updatedTask;

    state = AsyncData(
      todos,
    );
  }

  Future<void> deleteTask({
    required num id,
  }) async {
    state = const AsyncLoading();

    final todos = state.value!;
    todos.removeWhere((todo) => todo.id == id);

    state = AsyncData(
      todos,
    );
  }

}
