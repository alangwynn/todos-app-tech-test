import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:technical_test_flutter_sr/common/extensions.dart';
import 'package:technical_test_flutter_sr/common/widgets/widgets.dart';
import 'package:technical_test_flutter_sr/config/theme/theme_provider.dart';
import 'package:technical_test_flutter_sr/config/theme/themes.dart';
import 'package:technical_test_flutter_sr/features/home/presentation/providers/todos/todos_state_notifier.dart';
import 'package:technical_test_flutter_sr/features/home/presentation/widgets/widgets.dart';
import 'package:technical_test_flutter_sr/features/login/presentation/providers/login/login_user_state_notifier.dart';

class HomeWidget extends ConsumerWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    final todos = ref.watch(todosStateNotifierProvider);
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;
    final user = ref.watch(loginUserStateNotifierProvider).value!;

    ref.listen(todosStateNotifierProvider, (previoud, next) {
      if (next.isLoading) {
        context.loaderOverlay.show();
      } else if (next.hasError) {
        context.loaderOverlay.hide();
        ToastOverlay.showToastMessage(
          next.error.toString(),
          ToastType.error,
          context,
        );
      } else {
        context.loaderOverlay.hide();
        ToastOverlay.showToastMessage(
          l10n.taskActionTaskDetailScreen,
          ToastType.success,
          context,
        );
        if (GoRouter.of(context).canPop()) {
          GoRouter.of(context).pop();
        }
      }
    });

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
                    color: isDarkMode ? Colors.white : const Color(0xFF252529),
                  ),
                  children: [
                    TextSpan(
                      text: user.name[0].toUpperCase() + user.name.substring(1).toLowerCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? Colors.white : const Color(0xFF252529),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                l10n.homeScreenTaskList,
                style: AppTypography.l.copyWith(
                  fontWeight: FontWeight.w600,
                  color: isDarkMode ? Colors.white : const Color(0xFF252529),
                ),
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
