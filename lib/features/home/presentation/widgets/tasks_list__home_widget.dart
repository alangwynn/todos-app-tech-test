import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:technical_test_flutter_sr/common/extensions.dart';
import 'package:technical_test_flutter_sr/common/widgets/widgets.dart';
import 'package:technical_test_flutter_sr/config/theme/theme_provider.dart';
import 'package:technical_test_flutter_sr/features/home/domain/entities/entities.dart';
import 'package:technical_test_flutter_sr/features/home/presentation/screens/screens.dart';
import 'package:technical_test_flutter_sr/features/home/presentation/widgets/widgets.dart';
import 'package:technical_test_flutter_sr/features/home/presentation/providers/todos/todos_state_notifier.dart';

class TasksListHomeWidget extends ConsumerStatefulWidget {
  const TasksListHomeWidget({super.key});

  @override
  ConsumerState<TasksListHomeWidget> createState() =>
      _TasksListHomeWidgetState();
}

class _TasksListHomeWidgetState extends ConsumerState<TasksListHomeWidget> {
  String filterOption = 'Todos';
  final _taskTitleController = TextEditingController();
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final tasksState = ref.watch(todosStateNotifierProvider);
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;
    final tasks = tasksState.value;

    if (tasks == null) return const Text('No hay tareas para mostrar');

    List<TaskEntity> filteredTasks;
    if (filterOption == l10n.taskListOptionPending) {
      filteredTasks = tasks.where((task) => !task.completed).toList();
    } else if (filterOption == l10n.taskListOptionCompleted) {
      filteredTasks = tasks.where((task) => task.completed).toList();
    } else {
      filteredTasks = tasks;
    }

    if (searchQuery.isNotEmpty) {
      filteredTasks = filteredTasks.where((task) {
        return task.title.toLowerCase().contains(searchQuery.toLowerCase());
      }).toList();
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.0.w),
          child: Column(
            children: [
              SizedBox(height: 40.0.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AGSelectInput(
                    value: filterOption,
                    items: [
                      l10n.taskListOptionAll,
                      l10n.taskListOptionPending,
                      l10n.taskListOptionCompleted
                    ],
                    onChanged: (value) {
                      setState(() {
                        filterOption = value!;
                      });
                    },
                  ),
                  SizedBox(width: 10.0.w),
                  AGButton(
                    mode: isDarkMode ? AGButtonMode.dark : AGButtonMode.light,
                    size: AGButtonSize.m,
                    onPressed: () {
                      GoRouter.of(context).push(CreateTaskScreen.routeName);
                    },
                    child: Text(
                      l10n.createTaskButton
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0.h),
              AGTextfield(
                hintText: l10n.hintTextTextFieldFilterTaskList,
                controller: _taskTitleController,
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
              ),
              TasksListWidget(tasks: filteredTasks),
            ],
          ),
        ),
      ),
    );
  }
}
