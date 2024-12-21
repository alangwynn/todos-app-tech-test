import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:technical_test_flutter_sr/config/theme/themes.dart';

class AGButton extends StatelessWidget {
  const AGButton({
    required this.onPressed,
    required this.child,
    this.size = AGButtonSize.s,
    this.disabled = false,
    this.isExpanded = false,
    this.style = AGButtonStyle.primary,
    this.mode = AGButtonMode.light,
    super.key,
  });

  final VoidCallback onPressed;
  final Widget child;
  final AGButtonSize size;
  final bool disabled;
  final bool isExpanded;
  final AGButtonStyle style;
  final AGButtonMode mode;

  EdgeInsets getPadding() {
    switch (size) {
      case AGButtonSize.s:
        return EdgeInsets.symmetric(
          horizontal: 16.0.sp,
          vertical: 8.0.sp,
        );

      case AGButtonSize.m:
        return EdgeInsets.symmetric(
          horizontal: 20.0.sp,
          vertical: 12.0.sp
        );
    }
  }

  MainAxisSize getMainAxisSize() {
    if (isExpanded) {
      return MainAxisSize.max;
    } else {
      return MainAxisSize.min;
    }
  }

  ButtonStyle getStyle() {
    if (style == AGButtonStyle.primary && disabled) {
      if (mode == AGButtonMode.light) {
        return getFromSize(AppButtonStyles.primaryLightDisabled);
      } else {
        return getFromSize(AppButtonStyles.primaryDarkDisabled);
      }
    }

    if (style == AGButtonStyle.secondary && disabled) {
      if (mode == AGButtonMode.light) {
        return getFromSize(AppButtonStyles.secondaryLightDisabled);
      } else {
        return getFromSize(AppButtonStyles.secondaryDarkDisabled);
      }
    }

    switch (style) {
      case AGButtonStyle.primary:
        if (mode == AGButtonMode.light) {
          return getFromSize(AppButtonStyles.primaryLight);
        } else {
          return getFromSize(AppButtonStyles.primaryDark);
        }

      case AGButtonStyle.secondary:
        if (mode == AGButtonMode.light) {
          return getFromSize(AppButtonStyles.secondaryLight);
        } else {
          return getFromSize(AppButtonStyles.secondaryDark);
        }
    }
  }

  ButtonStyle getFromSize(ButtonStyle buttonStyle) {
    switch (size) {
      case AGButtonSize.s:
        return buttonStyle.copyWith(
          textStyle: const WidgetStatePropertyAll<TextStyle>(
            TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w600,
            )
          ),
        );

      case AGButtonSize.m:
        return buttonStyle;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.heigth(),
      width: isExpanded ? double.infinity : null,
      child: TextButton(
        style: getStyle(),
        onPressed: disabled ? null : onPressed,
        child: Padding(
          padding: getPadding(),
          child: child
        ),
      ),
    );
  }
}

enum AGButtonSize {
  s,
  m,
}

enum AGButtonStyle {
  primary,
  secondary,
}

enum AGButtonMode {
  light,
  dark,
}


extension on AGButtonSize {
  double heigth() => (this == AGButtonSize.s) ? 32 : 44;
}
