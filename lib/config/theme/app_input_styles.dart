
import 'package:flutter/material.dart';
import 'package:technical_test_flutter_sr/config/theme/themes.dart';

class AppInputDecorationTheme {

  static final normal = InputDecorationTheme(
    isDense: true,
    fillColor: Colors.white,
    hintStyle: AppTypography.l
        .copyWith(color: const Color(0xFFB4B4BF)),
    errorStyle: AppTypography.m
        .copyWith(color: const Color(0xFFFF739B)),
    focusedErrorBorder: const OutlineInputBorder(
      borderSide: BorderSide(color:Color(0xFFFA3E74), width: 2),
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFC6C6CC)),
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xFF268BFF),
        width: 2,
      ),
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFFA3E74)),
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    disabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFEAEAEB)),
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 12,
    ),
  );

}
