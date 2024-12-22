import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:technical_test_flutter_sr/common/extensions.dart';
import 'package:technical_test_flutter_sr/common/widgets/widgets.dart';
import 'package:technical_test_flutter_sr/config/theme/theme_provider.dart';
import 'package:technical_test_flutter_sr/features/login/presentation/providers/login/login_user_state_notifier.dart';
import 'package:technical_test_flutter_sr/features/login/presentation/screens/screens.dart';

class ProfileWidget extends ConsumerWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final user = ref.read(loginUserStateNotifierProvider).value!;
    final appTheme = ref.watch(themeNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appTheme.isDarkMode ? const Color(0xFF252529) : const Color(0xFFF7F7F7),
        title: Text(
          l10n.appBarTitleUserProfileScreen,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${l10n.nameUserProfileScreen} ${user.name} ${user.lastName}',
              style: TextStyle(
                fontSize: 20,
                color: appTheme.isDarkMode ? Colors.white : const Color(0xFF252529),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              '${l10n.emailUserProfileScreen} ${user.email}',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 100.h),
            Text(
              l10n.configTitleProfileScreen,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: appTheme.isDarkMode ? Colors.white : const Color(0xFF252529),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  l10n.toggleButtonDarkMode,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: appTheme.isDarkMode ? Colors.white : const Color(0xFF252529),
                  ),
                ),
                Switch(
                  value: appTheme.isDarkMode,
                  onChanged: (value) {
                    ref.read(themeNotifierProvider.notifier).toggleDarkMode();
                  },
                ),
              ],
            ),
            const Spacer(),
            SizedBox( 
              width: 90.w,
              child: AGButton(
                mode: appTheme.isDarkMode ? AGButtonMode.dark : AGButtonMode.light,
                isExpanded: false,
                onPressed: () {
                  GoRouter.of(context).go(LoginScreen.routeName);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.logout_outlined,
                      size: 16.0.sp,
                    ),
                    SizedBox(width: 8.0.w,),
                    Text(l10n.logoutButtonProfileScreen),
                  ],
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
