
import 'package:technical_test_flutter_sr/config/client/client_methods.dart';
import 'package:technical_test_flutter_sr/features/home/domain/datasource/datasources.dart';
import 'package:technical_test_flutter_sr/features/home/domain/entities/task_entity.dart';
import 'package:technical_test_flutter_sr/features/home/domain/repositories/repositories.dart';

class HomeRepositoryImpl implements HomeRepository {

  HomeRepositoryImpl({
    required this.datasource,
  });

  final HomeDatasource datasource;

  @override
  Future<Result<List<TaskEntity>?>> getTasks() {
    return datasource.getTasks();
  }

}
