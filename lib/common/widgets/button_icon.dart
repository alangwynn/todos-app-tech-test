import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:technical_test_flutter_sr/common/widgets/widgets.dart';
import 'package:technical_test_flutter_sr/config/theme/themes.dart';

class AGButtonIcon extends StatefulWidget {
  const AGButtonIcon({
    required this.onPressed,
    required this.icon,
    this.identifier,
    this.mode = AGButtonMode.light,
    this.size = AGButtonIconSize.small,
    this.label,
    this.disabled = false,
    super.key,
  });

  final AGButtonMode mode;

  final VoidCallback onPressed;

  final Widget icon;

  final AGButtonIconSize size;

  final String? label;

  final bool disabled;

  final ButtonIconIdentifier? identifier;

  @override
  State<AGButtonIcon> createState() => _AGButtonIconState();
}

class _AGButtonIconState extends State<AGButtonIcon> {
  ButtonStyle? getStyle(BuildContext context) {
    final isLight = widget.mode == AGButtonMode.light;
    final isDark = widget.mode == AGButtonMode.dark;

    if (!isDark && !isLight) throw Exception('Invalid style');

    if (widget.disabled && isLight) {
      return AppButtonStyles.secondaryLightDisabled.copyWith(
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(28.sp)),
              side: const BorderSide(
                color: Color(0xFFEAEAEB),
              )),
        ),
      );
    }
    if (widget.disabled && isDark) {
      return AppButtonStyles.primaryDarkDisabled;
    }

    if (isDark) {
      return AppButtonStyles.primaryDark.copyWith(
        backgroundColor: const WidgetStatePropertyAll(
          Color(0xFF404047),
        ),
      );
    }

    if (isLight) {
      return AppButtonStyles.secondaryLight;
    }
    return null;
  }

  Color getIConColor() {
    if (widget.mode == AGButtonMode.dark) {
      if (widget.disabled) {
        return const Color(0xFF6C6C78);
      } else {
        return Colors.white;
      }
    } else {
      if (widget.disabled) {
        return const Color(0xFFC6C6CC);
      } else {
        return const Color(0xFF252529);
      }
    }
  }

  Color getTextColor() {
    if (widget.disabled) {
      return (widget.mode == AGButtonMode.dark)
          ? const Color(0xFF6C6C78)
          : const Color(0xFFC6C6CC);
    } else {
      return (widget.mode == AGButtonMode.dark)
          ? Colors.white
          : const Color(0xFF252529);
    }
  }

  double getWidth() => (widget.label != null) ? 64 : widget.size.get();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getWidth(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox.square(
            dimension: widget.size.get(),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                IconButton(
                  style: getStyle(context),
                  onPressed: widget.disabled ? null : widget.onPressed,
                  icon: widget.icon,
                ),
              ],
            ),
          ),
          if (widget.label != null)
            Padding(
              padding: EdgeInsets.only(top: 8.0.h),
              child: Text(
                widget.label!,
                style: TextStyle(
                  color: getTextColor(),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
        ],
      ),
    );
  }
}

enum AGButtonIconSize {
  small,
  medium,
}

extension on AGButtonIconSize {
  double get() {
    switch (this) {
      case AGButtonIconSize.small:
        return 32;
      case AGButtonIconSize.medium:
        return 44;
    }
  }
}

class ButtonIconIdentifier {
  ///
  const ButtonIconIdentifier({
    this.icon,
    this.size,
    this.label,
  });

  final String? icon;

  final String? size;

  final String? label;
}
