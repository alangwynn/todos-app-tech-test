
import 'package:technical_test_flutter_sr/config/client/client.dart';
import 'package:technical_test_flutter_sr/features/login/data/models/login_response_model.dart';
import 'package:technical_test_flutter_sr/features/login/domain/datasources/datasources.dart';
import 'package:technical_test_flutter_sr/features/login/domain/repositories/repositories.dart';

class LoginRepositoryImpl extends LoginRepository {

  LoginRepositoryImpl({
    required this.datasource,
  });

  final LoginDatasource datasource;

  @override
  Future<Result<LoginResponseModel?>> login({required String email, required String password}) {
    return datasource.login(email: email, password: password);
  }

}
