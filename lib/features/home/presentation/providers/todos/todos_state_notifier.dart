
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:technical_test_flutter_sr/features/home/domain/entities/entities.dart';
import 'package:technical_test_flutter_sr/features/home/presentation/providers/providers.dart';

part 'todos_state_notifier.g.dart';

@riverpod
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

}
