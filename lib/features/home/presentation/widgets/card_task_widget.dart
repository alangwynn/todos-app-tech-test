import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:technical_test_flutter_sr/common/extensions.dart';
import 'package:technical_test_flutter_sr/common/widgets/button_icon.dart';
import 'package:technical_test_flutter_sr/features/home/domain/entities/entities.dart';
import 'package:technical_test_flutter_sr/features/home/presentation/providers/todos/todos_state_notifier.dart';
import 'package:technical_test_flutter_sr/features/home/presentation/screens/screens.dart';
import 'package:technical_test_flutter_sr/helpers/helpers.dart';

class CardTaskWidget extends ConsumerWidget {
  const CardTaskWidget({required this.task, super.key});

  final TaskEntity task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    void confirmDeleteTask() async {
      bool? shouldDelete = await AlertHelper.confirmDeleteTask(context);

      if (shouldDelete == true) {
        ref
            .read(todosStateNotifierProvider.notifier)
            .deleteTask(id: task.id);
      }
    }

    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(
          TaskDetailScreen.routeName,
          extra: task,
        );
      },
      child: Card(
        margin: EdgeInsets.only(bottom: 8.0.h),
        child: Padding(
          padding: EdgeInsets.all(12.0.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          task.title,
                          style: TextStyle(
                            fontSize: 18.0.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4.0.h),
                        Text(
                          task.description,
                          style: TextStyle(fontSize: 14.0.sp),
                        ),
                      ],
                    ),
                  ),
                  AGButtonIcon(
                    onPressed: confirmDeleteTask,
                    icon: const Icon(
                      Icons.delete,
                      color: Color(0xFFFA3E74),
                    ),
                  )
                ],
              ),
              Text(
                task.description,
                style: TextStyle(fontSize: 14.0.sp),
              ),
              SizedBox(height: 8.0.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${l10n.cardUserId} ${task.userId}",
                    style: TextStyle(fontSize: 12.0.sp, color: Colors.grey),
                  ),
                  Text(
                    task.completed ? l10n.taskStatusCompleted : l10n.taskStatusPending,
                    style: TextStyle(
                      fontSize: 12.0.sp,
                      color: task.completed ? Colors.green : Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
