
import 'package:fpdart/fpdart.dart';
import 'package:technical_test_flutter_sr/config/client/client.dart';
import 'package:technical_test_flutter_sr/features/home/data/models/models.dart';
import 'package:technical_test_flutter_sr/features/home/domain/datasource/datasources.dart';
import 'package:technical_test_flutter_sr/features/home/domain/entities/task_entity.dart';

class RemoteHomeDatasource extends HomeDatasource {

  RemoteHomeDatasource({
    required ApiHttpClient client,
  }) : _client = client;

  final ApiHttpClient _client;

  @override
  Future<Result<List<TaskEntity>?>> getTasks() async {
    final response = await _client.get(
      path: '/todos',
      deserializeResponseFunctionList: (json) => json,
      baseUrl: 'https://jsonplaceholder.typicode.com'
    );

    return response.fold((error) {
      return left(error);
    }, (data) {
      final todos = data!.map<TodosResponseModel>((x) => TodosResponseModel.fromJson(x)).toList();
      final tasks = todos.map((todo) => todo.toEntity()).toList();
      return right(tasks);
    });
  }

}
