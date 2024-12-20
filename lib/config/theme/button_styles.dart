
import 'package:flutter/material.dart';

class AppButtonStyles {

  static final baseStyle = ButtonStyle(
    padding: const WidgetStatePropertyAll(EdgeInsets.zero),
    shape: WidgetStateProperty.all(
      const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(28)),
      ),
    ),
    textStyle: const WidgetStatePropertyAll(
      TextStyle(
        fontWeight: FontWeight.w400
      )
    ),
    foregroundColor: const WidgetStatePropertyAll(Colors.white),
  );

  static ButtonStyle primaryLight = baseStyle.copyWith(
    textStyle: const WidgetStatePropertyAll(
      TextStyle(
        fontWeight: FontWeight.w600,
      )
    ),
    backgroundColor: WidgetStateProperty.all(const Color(0xFF252529)),
    overlayColor: const WidgetStatePropertyAll(
      Color(0xFF404047),
    ),
  );

  static ButtonStyle primaryLightDisabled = primaryLight.copyWith(
    backgroundColor: WidgetStateProperty.all(
      const Color(0xFFEAEAEB),
    ),
    foregroundColor: WidgetStateProperty.all(
      const Color(0xFFC6C6CC),
    ),
  );

}
