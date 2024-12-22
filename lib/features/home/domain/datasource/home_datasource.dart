
import 'package:technical_test_flutter_sr/config/client/client.dart';
import 'package:technical_test_flutter_sr/features/home/domain/entities/entities.dart';

abstract class HomeDatasource {

  Future<Result<List<TaskEntity>?>> getTasks();

}
