import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:technical_test_flutter_sr/common/extensions.dart';
import 'package:technical_test_flutter_sr/features/home/domain/entities/entities.dart';

class CardTaskWidget extends StatelessWidget {
  const CardTaskWidget({required this.task, super.key});

  final TaskEntity task;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return GestureDetector(
      onTap: () {
        
      },
      child: Card(
        margin: EdgeInsets.only(bottom: 8.0.h),
        child: Padding(
          padding: EdgeInsets.all(12.0.sp),
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
