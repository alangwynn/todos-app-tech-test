import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:technical_test_flutter_sr/config/theme/theme_provider.dart';
import 'package:technical_test_flutter_sr/config/theme/themes.dart';

/// Standard Textfield
class AGTextfield extends ConsumerStatefulWidget {
  const AGTextfield({
    this.onChanged,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.onTapPrefixIcon,
    this.onTapSuffixIcon,
    this.enabled = true,
    this.maxLength,
    this.controller,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.obscureText = false,
    this.maxLines,
    this.label = '',
    super.key,
  });

  /// Callback when textfield change
  final void Function(String)? onChanged;

  /// Text to display inside the widget
  final String? hintText;

  /// Show a prefix on the input
  final Widget? prefixIcon;

  /// Enable or disable textfield suffixIcon
  final Widget? suffixIcon;

  /// On tap prefix do an action
  final VoidCallback? onTapPrefixIcon;

  /// On tap suffix icon do an action
  final VoidCallback? onTapSuffixIcon;

  /// Enable or disable textfield
  final bool enabled;

  /// max length for textfield
  final int? maxLength;

  /// Controller for Textfield
  final TextEditingController? controller;

  /// Auto correct suggestions
  final bool autocorrect;

  /// Enable suggestions for textfield
  final bool enableSuggestions;

  /// Show text or not with obscure text option
  final bool obscureText;

  /// If you want to set a max height for the textfield
  /// you can use this property
  final int? maxLines;

  /// Label for textfield
  final String label;

  @override
  ConsumerState<AGTextfield> createState() => _AGTextfieldState();
}

class _AGTextfieldState extends ConsumerState<AGTextfield> {
  int currentLength = 0;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != '')
          Padding(
            padding: EdgeInsets.only(bottom: 8.0.sp),
            child: Text(
              widget.label,
              style: AppTypography.l.copyWith(
                color: isDarkMode ? Colors.white : const Color(0xFF252529),
              ),
            ),
          ),
        TextField(
          controller: widget.controller,
          maxLength: widget.maxLength,
          autocorrect: widget.autocorrect,
          enableSuggestions: widget.enableSuggestions,
          obscureText: widget.obscureText,
          maxLines: widget.maxLines,
          decoration: InputDecoration(
            filled: true,
            hintText: widget.hintText,
            prefixIcon: widget.prefixIcon != null
                ? GestureDetector(
                    onTap: widget.onTapPrefixIcon,
                    child: Container(
                        margin: EdgeInsets.only(left: 12.0.w),
                        child: widget.prefixIcon),
                  )
                : const SizedBox.shrink(),
            contentPadding:
                EdgeInsets.symmetric(vertical: 12.0.h, horizontal: 16.0.w),
            prefixIconConstraints: BoxConstraints(
              minHeight: 44.h,
              minWidth: 16.w,
            ),
            fillColor: widget.enabled ? Colors.white : const Color(0xFFEAEAEB),
            suffixIcon: widget.suffixIcon != null
                ? GestureDetector(
                    onTap: widget.onTapSuffixIcon,
                    child: widget.suffixIcon,
                  )
                : const SizedBox.shrink(),
          ),
          onChanged: widget.onChanged,
        ),
      ],
    );
  }
}
