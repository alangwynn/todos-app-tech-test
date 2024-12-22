import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:technical_test_flutter_sr/common/extensions.dart';
import 'package:technical_test_flutter_sr/config/theme/themes.dart';
import 'package:technical_test_flutter_sr/features/home/presentation/providers/todos/todos_state_notifier.dart';
import 'package:technical_test_flutter_sr/features/home/presentation/widgets/widgets.dart';

class HomeWidget extends ConsumerWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    final todos = ref.watch(todosStateNotifierProvider);

    return todos.when(data: (data) {
      return SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 24.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50.h),
              RichText(
                text: TextSpan(
                  text: l10n.homeScreenTitle,
                  style: TextStyle(
                    fontSize: 18.0.sp,
                    color: const Color(0xFF252529),
                  ),
                  children: const [
                    TextSpan(
                      text: 'alan',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                l10n.homeScreenTaskList,
                style: AppTypography.l.copyWith(fontWeight: FontWeight.w600),
              ),
              TasksListWidget(
                tasks: (data ?? [])
                    .where((task) => !task.completed)
                    .take(10)
                    .toList(),
              )
            ],
          ),
        ),
      );
    }, error: (error, __) {
      return Text(error.toString());
    }, loading: () {
      return const Center(
        child: CircularProgressIndicator(
          color: Color(0xFF252529),
        ),
      );
    });
  }
}
