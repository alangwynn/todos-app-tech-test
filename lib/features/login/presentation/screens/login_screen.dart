import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:technical_test_flutter_sr/common/extensions.dart';
import 'package:technical_test_flutter_sr/common/widgets/widgets.dart';
import 'package:technical_test_flutter_sr/helpers/helpers.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const routeName = '/login-screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userController = TextEditingController();

  final passwordController = TextEditingController();

  bool isButtonDisabled = true;

  void disableButton(String userInputText, String passwordInputText) {
    if (userInputText.isEmpty || passwordInputText.isEmpty) {
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
      body: SafeArea(
        top: false,
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
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: 24.0.w
                ),
                decoration: const BoxDecoration(
                  color: Color(0xFFEAEAEB),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )
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
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    AGTextfield(
                      label: l10n.usernameInputLabel,
                      prefixIcon: const Icon(
                        Icons.account_circle_outlined,
                        color: Colors.blueGrey,
                      ),
                      controller: userController,
                      onChanged: (value) {
                        disableButton(userController.text, passwordController.text);
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    AGTextfieldPassword(
                      label: l10n.passwordInputLabel,
                      controller: passwordController,  
                      onChanged: (value) {
                        disableButton(userController.text, passwordController.text);
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
                      },
                      child: Text(
                        l10n.loginButtonText,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
