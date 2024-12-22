import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:technical_test_flutter_sr/common/widgets/widgets.dart';
import 'package:technical_test_flutter_sr/config/theme/theme_provider.dart';

class TaskDetailAppBarWidget extends ConsumerWidget implements PreferredSizeWidget  {
  const TaskDetailAppBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;
    return AppBar(
      backgroundColor: isDarkMode ? const Color(0xFF252529) : const Color(0xFFF7F7F7),
      leading: AGButtonIcon(
        onPressed: () {
          GoRouter.of(context).pop();
        },
        icon: Icon(
          Icons.arrow_back,
          size: 16.sp,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}