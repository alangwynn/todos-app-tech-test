import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:technical_test_flutter_sr/config/storage_manager/storage_manager.dart';
import 'package:technical_test_flutter_sr/features/login/domain/entities/entities.dart';
import 'package:technical_test_flutter_sr/features/login/presentation/providers/providers.dart';

part 'login_user_state_notifier.g.dart';

@Riverpod(keepAlive: true)
class LoginUserStateNotifier extends _$LoginUserStateNotifier {

  @override
  FutureOr<UserEntity> build() {
    return UserEntity.empty();
  }

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();

    final repository = ref.read(loginRepositoryProvider);
    final response = await repository.login(email: email, password: password);

    response.fold((error) {
      state = AsyncError(
        error.message,
        error.stackTrace ?? StackTrace.current,
      );
    }, (data) async {
      final parts = email.split('@');
      final userParts = parts[0].split('.');
      final firstName = userParts[0];
      final lastName = userParts[1];

      state = AsyncData(
        UserEntity(
          email: email,
          name: firstName,
          lastName: lastName
        ),
      );

      await SecureStorageManager.instance.setString(
        key: 'token',
        value: data?.token ?? '',
      );

    });
  }
}

