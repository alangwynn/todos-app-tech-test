import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:technical_test_flutter_sr/common/extensions.dart';
import 'package:technical_test_flutter_sr/common/widgets/widgets.dart';
import 'package:technical_test_flutter_sr/features/login/presentation/widgets/widgets.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  static const routeName = '/register-screen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  bool isButtonDisabled = true;

  void disableButton(String emailInputText, String passwordInputText) {
    if (emailInputText.isEmpty ||
        passwordInputText.isEmpty ||
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
          onPressed: () {},
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
                ),
                SizedBox(
                  height: 20.h,
                ),
                AGTextfieldPassword(
                    label: l10n.passwordInputLabel,
                    controller: passwordController),
                SizedBox(
                  height: 20.h,
                ),
                AGTextfieldPassword(
                    label: l10n.confirmPasswordInputLabel,
                    controller: confirmPasswordController),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
