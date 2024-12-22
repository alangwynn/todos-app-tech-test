import 'package:flutter/material.dart';
import 'package:technical_test_flutter_sr/features/home/domain/entities/entities.dart';
import 'package:technical_test_flutter_sr/features/home/presentation/widgets/widgets.dart';

class TasksListWidget extends StatelessWidget {
  const TasksListWidget({
    required this.tasks,
    super.key
  });

  final List<TaskEntity> tasks;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return CardTaskWidget(task: task,);
      },
    );
  }
}