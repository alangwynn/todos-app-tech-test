import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:technical_test_flutter_sr/common/widgets/widgets.dart';

class TaskDetailAppBarWidget extends StatelessWidget implements PreferredSizeWidget  {
  const TaskDetailAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFF7F7F7),
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