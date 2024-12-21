
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastOverlay {

  static showToastMessage(String message, ToastType type, BuildContext context) {

    FToast fToast = FToast();
    fToast.init(context);

    Color backgroundColor;
    switch (type) {
      case ToastType.success:
        backgroundColor = const Color(0xFF1DBF79);
        break;
      case ToastType.warning:
        backgroundColor = const Color(0xFFEB9C00);
        break;
      case ToastType.error:
        backgroundColor = const Color(0xFFFA3E74);
        break;
    }

    Widget toast = Container(
      padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 12.0.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: backgroundColor,
      ),
      child: Text(
        message,
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );

  }

}

enum ToastType {
  success,
  warning,
  error,
}
