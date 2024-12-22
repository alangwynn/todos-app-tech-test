
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:technical_test_flutter_sr/features/login/data/models/models.dart';
import 'package:technical_test_flutter_sr/features/login/presentation/providers/providers.dart';

part 'register_user_state_notifier.g.dart';

@riverpod
class RegisterUserStateNotifier extends _$RegisterUserStateNotifier {

  @override
  FutureOr<RegisterResponseModel> build() {
    return RegisterResponseModel.empty();
  }

  Future<void> register({
    required String email,
    required String password,
  }) async {
    state =  const AsyncLoading();

    final repository = ref.read(loginRepositoryProvider);
    final response = await repository.register(email: email, password: password);

    response.fold((error) {
      state = AsyncError(
        error.message,
        error.stackTrace ?? StackTrace.current,
      );
    }, (data) {
      state = AsyncData(
        RegisterResponseModel(
          id: data?.id ?? 0,
          token: data?.token ?? '',
        ),
      );
    });
  }

}
