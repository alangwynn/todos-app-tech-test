
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:technical_test_flutter_sr/config/client/client.dart';
import 'package:technical_test_flutter_sr/features/home/data/datasources/datasources.dart';
import 'package:technical_test_flutter_sr/features/home/data/repositories/repositories.dart';
import 'package:technical_test_flutter_sr/features/home/domain/repositories/repositories.dart';

part 'providers.g.dart';

@riverpod
HomeRepository homeRepository(HomeRepositoryRef ref) {

  final client = ApiHttpClient();

  final remoteDatasource = RemoteHomeDatasource(
    client: client,
  );

  return HomeRepositoryImpl(
    datasource: remoteDatasource,
  );
}
