import 'package:technical_test_flutter_sr/config/client/client.dart';
import 'package:technical_test_flutter_sr/features/login/data/datasources/datasources.dart';
import 'package:technical_test_flutter_sr/features/login/data/repositories/repositories.dart';
import 'package:technical_test_flutter_sr/features/login/domain/repositories/repositories.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@riverpod
LoginRepository loginRepository(LoginRepositoryRef ref) {
  
  final client = ApiHttpClient();

  final remoteDatasource = LoginRemoteDatasource(
    client: client,
  );

  return LoginRepositoryImpl(
    datasource: remoteDatasource
  );

}