import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:technical_test_flutter_sr/common/widgets/widgets.dart';

class RegisterAppBarWidget extends StatelessWidget implements PreferredSizeWidget  {
  const RegisterAppBarWidget({super.key});

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