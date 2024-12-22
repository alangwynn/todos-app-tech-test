import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:technical_test_flutter_sr/common/extensions.dart';
import 'package:technical_test_flutter_sr/common/widgets/widgets.dart';
import 'package:technical_test_flutter_sr/config/theme/theme_provider.dart';
import 'package:technical_test_flutter_sr/features/home/domain/entities/entities.dart';
import 'package:technical_test_flutter_sr/features/home/presentation/providers/todos/todos_state_notifier.dart';
import 'package:technical_test_flutter_sr/features/home/presentation/widgets/widgets.dart';

class CreateTaskScreen extends ConsumerStatefulWidget {
  const CreateTaskScreen({super.key});

  static const routeName = '/create-task-screen';

  @override
  ConsumerState<CreateTaskScreen> createState() => _CreateTaskScreen();
}

class _CreateTaskScreen extends ConsumerState<CreateTaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  bool _isCompleted = false;


  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _saveTask() {
    final task = TaskEntity(
      id: 0,
      userId: 0,
      title: _titleController.text,
      description: _descriptionController.text,
      completed: _isCompleted,
    );

    ref.read(todosStateNotifierProvider.notifier).createTask(task: task);
    GoRouter.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;

    return Scaffold(
      appBar: const TaskDetailAppBarWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 24.0.w),
          child: AGButton(
            mode: isDarkMode ? AGButtonMode.dark : AGButtonMode.light,
            isExpanded: true,
            size: AGButtonSize.m,
            onPressed: _saveTask,
            child: Text(
              l10n.saveButtonTaskDetailScreen,
            ),
          )),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.createTaskScreenTitle,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : const Color(0xFF252529),
              ),
            ),
            SizedBox(height: 10.0.h),
            AGTextfield(
              controller: _titleController,
              label: l10n.titleTaskDetailScreen,
            ),
            SizedBox(height: 16.0.h),
            AGTextfield(
              controller: _descriptionController,
              label: l10n.descriptionTaskDetailScreen,
              maxLines: 3,
            ),
            SizedBox(height: 16.0.h),
            Row(
              children: [
                Checkbox(
                  activeColor: const Color(0xFF252529),
                  value: _isCompleted,
                  onChanged: (value) {
                    setState(() {
                      _isCompleted = value ?? false;
                    });
                  },
                ),
                Text(
                  l10n.completedTaskDetailScreen,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: isDarkMode ? Colors.white : const Color(0xFF252529),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
