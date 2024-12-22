import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:technical_test_flutter_sr/common/extensions.dart';
import 'package:technical_test_flutter_sr/common/widgets/widgets.dart';
import 'package:technical_test_flutter_sr/config/theme/theme_provider.dart';
import 'package:technical_test_flutter_sr/features/home/domain/entities/entities.dart';
import 'package:technical_test_flutter_sr/features/home/presentation/providers/todos/todos_state_notifier.dart';
import 'package:technical_test_flutter_sr/features/home/presentation/widgets/widgets.dart';
import 'package:technical_test_flutter_sr/helpers/helpers.dart';

class TaskDetailScreen extends ConsumerStatefulWidget {
  const TaskDetailScreen({required this.task, super.key});

  final TaskEntity task;

  static const routeName = '/task-detail-screen';

  @override
  ConsumerState<TaskDetailScreen> createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends ConsumerState<TaskDetailScreen> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  bool _isCompleted = false;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.task.title);
    _descriptionController =
        TextEditingController(text: widget.task.description);
    _isCompleted = widget.task.completed;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _saveTask() {
    final updatedTask = widget.task.copyWith(
      title: _titleController.text,
      description: _descriptionController.text,
      completed: _isCompleted,
    );

    ref.read(todosStateNotifierProvider.notifier).updateTask(task: updatedTask);
  }

  void _confirmDeleteTask(bool isDarkMode) async {
    bool? shouldDelete = await AlertHelper.confirmDeleteTask(context, isDarkMode);

    if (shouldDelete == true) {
      ref
          .read(todosStateNotifierProvider.notifier)
          .deleteTask(id: widget.task.id);
    }
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AGButton(
                mode: isDarkMode ? AGButtonMode.dark : AGButtonMode.light,
                isExpanded: true,
                size: AGButtonSize.m,
                onPressed: _saveTask,
                child: Text(
                  l10n.saveButtonTaskDetailScreen,
                ),
              ),
              SizedBox(
                height: 8.0.h,
              ),
              AGButton(
                mode: isDarkMode ? AGButtonMode.dark : AGButtonMode.light,
                isExpanded: true,
                size: AGButtonSize.m,
                style: AGButtonStyle.secondary,
                onPressed: () {
                  _confirmDeleteTask(isDarkMode);
                },
                child: Text(
                  l10n.deleteButtonTaskDetailScreen,
                ),
              ),
            ],
          )),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: l10n.idTaskDetailScreen,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : const Color(0xFF252529),
                ),
                children: [
                  TextSpan(
                    text: widget.task.id.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: isDarkMode ? Colors.white : const Color(0xFF252529),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0.h),
            RichText(
              text: TextSpan(
                text: l10n.cardUserId,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : const Color(0xFF252529),
                ),
                children: [
                  TextSpan(
                    text: widget.task.userId.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: isDarkMode ? Colors.white : const Color(0xFF252529),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0.h),
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
