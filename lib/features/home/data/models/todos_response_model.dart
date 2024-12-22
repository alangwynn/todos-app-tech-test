
import 'package:technical_test_flutter_sr/features/home/domain/entities/entities.dart';

class TodosResponseModel {

  TodosResponseModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
    this.completed = false,
  });

  factory TodosResponseModel.fromJson(Map<String, dynamic> json) {
    return TodosResponseModel(
      id: json['id'] != null ? json['id'] as num : 0,
      userId: json['userId'] != null ? json['userId'] as num : 0,
      title: json['title'] != null ? json['title'] as String : '',
      description: json['description'] != null ? json['description'] as String : '',
      completed: json['completed'] != null ? json['completed'] as bool : false,
    );
  }

  final num id;
  final num userId;
  final String title;
  final String description;
  final bool completed;

  TaskEntity toEntity() {
    return TaskEntity(
      id: id,
      userId: userId,
      title: title,
      description: description,
      completed: completed
    );
  }

}
