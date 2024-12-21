import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:technical_test_flutter_sr/config/theme/themes.dart';

class AGTextfield extends StatefulWidget {
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

  final void Function(String)? onChanged;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onTapPrefixIcon;
  final VoidCallback? onTapSuffixIcon;
  final bool enabled;
  final int? maxLength;
  final TextEditingController? controller;
  final bool autocorrect;
  final bool enableSuggestions;
  final bool obscureText;
  final int? maxLines;
  final String label;

  @override
  State<AGTextfield> createState() => _AGTextfieldState();
}

class _AGTextfieldState extends State<AGTextfield> {
  int currentLength = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != '')
          Padding(
            padding: EdgeInsets.only(bottom: 8.0.sp),
            child: Text(
              widget.label,
              style: AppTypography.l,
            ),
          ),
        TextField(
          controller: widget.controller,
          maxLength: widget.maxLength,
          autocorrect: widget.autocorrect,
          enableSuggestions: widget.enableSuggestions,
          obscureText: widget.obscureText,
          maxLines: 1,
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
