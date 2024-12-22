import 'package:fpdart/fpdart.dart';
import 'package:technical_test_flutter_sr/config/client/client.dart';
import 'package:technical_test_flutter_sr/features/login/data/models/login_response_model.dart';
import 'package:technical_test_flutter_sr/features/login/data/models/register_response_model.dart';
import 'package:technical_test_flutter_sr/features/login/domain/datasources/datasources.dart';

class LoginRemoteDatasource extends LoginDatasource {
  LoginRemoteDatasource({
    required ApiHttpClient client,
  }) : _client = client;

  final ApiHttpClient _client;

  final _basePath = '/api';

  @override
  Future<Result<LoginResponseModel?>> login({
    required String email,
    required String password,
  }) async {
    final response = await _client.post(
      path: '$_basePath/login',
      payload: {'email': email, 'password': password},
      deserializeResponseFunction: LoginResponseModel.fromJson,
    );

    return response.flatMap((a) => right(a));
  }

  @override
  Future<Result<RegisterResponseModel?>> register({
    required String email,
    required String password,
  }) async {
    final response = await _client.post(
      path: '$_basePath/register',
      payload: {'email': email, 'password': password},
      deserializeResponseFunction: RegisterResponseModel.fromJson,
    );

    return response.flatMap((a) => right(a));
  }
}
