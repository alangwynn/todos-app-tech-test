
import 'package:technical_test_flutter_sr/config/client/client.dart';
import 'package:technical_test_flutter_sr/features/login/data/models/models.dart';

abstract class LoginRepository {

  Future<Result<LoginResponseModel?>> login({
    required String email,
    required String password,
  });

  Future<Result<RegisterResponseModel?>> register({
    required String email,
    required String password,
  });

}
