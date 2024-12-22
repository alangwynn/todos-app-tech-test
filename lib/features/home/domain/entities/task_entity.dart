
import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {

  const TaskEntity({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
    this.completed = false,
  });

  factory TaskEntity.empty() {
    return const TaskEntity(
      id: 0,
      userId: 0,
      title: '',
      description: '',
    );
  }

  final num id;
  final num userId;
  final String title;
  final String description;
  final bool completed;

  @override
  String toString() {
    return '''TaskEntity(id: $id, userId: $userId, title: $title, description: $description, completed: $completed)''';
  }

  @override
  List<Object?> get props => [
    id,
    userId,
    title,
    description,
    completed
  ];

  TaskEntity copyWith({
    num? id,
    num? userId,
    String? title,
    String? description,
    bool? completed,
  }) => TaskEntity(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    title: title ?? this.title,
    description: description ?? this.description,
    completed: completed ?? this.completed,
  );

}
