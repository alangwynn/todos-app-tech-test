import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:technical_test_flutter_sr/common/extensions.dart';
import 'package:technical_test_flutter_sr/common/widgets/widgets.dart';
import 'package:technical_test_flutter_sr/features/home/presentation/screens/screens.dart';
import 'package:technical_test_flutter_sr/features/login/presentation/providers/login/login_user_state_notifier.dart';
import 'package:technical_test_flutter_sr/features/login/presentation/screens/screens.dart';
import 'package:technical_test_flutter_sr/helpers/helpers.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  static const routeName = '/login-screen';

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  bool isButtonDisabled = true;

  void disableButton() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      isButtonDisabled = true;
    } else {
      isButtonDisabled = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    ref.listen(loginUserStateNotifierProvider, (previous, next) {
      if (next.isLoading) {
        context.loaderOverlay.show();
      } else if (next.hasError) {
        context.loaderOverlay.hide();
        ToastOverlay.showToastMessage(
          next.error.toString(),
          ToastType.error,
          context,
        );
      } else if (next.hasValue) {
        context.loaderOverlay.hide();
        GoRouter.of(context).go(HomeScreen.routeName);
      }
    });

    return Scaffold(
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 60.h,
              ),
              Image.asset(
                AssetsHelper.taskAppLogo,
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                decoration: const BoxDecoration(
                  color: Color(0xFFEAEAEB),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height - (60.h + 80.h),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      l10n.loginTitle,
                      style: TextStyle(
                        fontSize: 24.0.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    AGTextfield(
                      label: l10n.emailInputLabel,
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                        color: Colors.blueGrey,
                      ),
                      controller: emailController,
                      onChanged: (value) {
                        disableButton();
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    AGTextfieldPassword(
                      label: l10n.passwordInputLabel,
                      controller: passwordController,
                      onChanged: (value) {
                        disableButton();
                      },
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    AGButton(
                      size: AGButtonSize.m,
                      isExpanded: true,
                      disabled: isButtonDisabled,
                      onPressed: () {
                        ref
                            .read(loginUserStateNotifierProvider.notifier)
                            .loginUser(
                                email: emailController.text,
                                password: passwordController.text);
                      },
                      child: Text(
                        l10n.loginButtonText,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(RegisterScreen.routeName);
                      },
                      child: Text(
                        l10n.loginCreateAccountText,
                        style: TextStyle(
                          fontSize: 12.0.sp,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
