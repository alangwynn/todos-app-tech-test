import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:technical_test_flutter_sr/common/extensions.dart';
import 'package:technical_test_flutter_sr/common/widgets/widgets.dart';
import 'package:technical_test_flutter_sr/features/login/presentation/providers/register/register_user_state_notifier.dart';
import 'package:technical_test_flutter_sr/features/login/presentation/widgets/widgets.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  static const routeName = '/register-screen';

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  bool isButtonDisabled = true;

  bool samePasswords() {
    if (passwordController.text == confirmPasswordController.text) {
      return true;
    }
    return false;
  }

  void disableButton() {
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      isButtonDisabled = true;
    } else {
      isButtonDisabled = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    ref.listen(registerUserStateNotifierProvider, (previous, next) {
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
        ToastOverlay.showToastMessage(
          l10n.registerAccountCreatedSuccess,
          ToastType.success,
          context,
        );
        GoRouter.of(context).pop();
      }
    });

    return Scaffold(
      appBar: const RegisterAppBarWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 24.0.w),
        child: AGButton(
          disabled: isButtonDisabled,
          size: AGButtonSize.m,
          isExpanded: true,
          onPressed: () {
            if (!samePasswords()) {
              setState(() {
                isButtonDisabled = true;
              });
              ToastOverlay.showToastMessage(
                l10n.alertPasswordsDifferent,
                ToastType.warning,
                context,
              );
              return;
            }
            ref.read(registerUserStateNotifierProvider.notifier).register(
                  email: emailController.text,
                  password: passwordController.text,
                );
          },
          child: Text(l10n.registerScreenButtonText),
        ),
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.0.w),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 60.h,
                ),
                Icon(
                  Icons.add_box,
                  color: const Color(0xFF268BFF),
                  size: 60.sp,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  l10n.registerScreenTitle,
                  style:
                      TextStyle(fontSize: 18.0.sp, fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: 30.h,
                ),
                AGTextfield(
                  label: l10n.emailInputLabel,
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
                  height: 20.h,
                ),
                AGTextfieldPassword(
                  label: l10n.confirmPasswordInputLabel,
                  controller: confirmPasswordController,
                  onChanged: (value) {
                    disableButton();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
