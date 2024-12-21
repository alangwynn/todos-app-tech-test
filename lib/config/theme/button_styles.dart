
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

  static ButtonStyle primaryDark = primaryLight.copyWith(
    backgroundColor: WidgetStateProperty.all(
      const Color(0xFF404047),
    ),
    overlayColor: const WidgetStatePropertyAll(
      Color(0xFF6C6C78),
    ),
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

  static ButtonStyle primaryDarkDisabled = primaryDark.copyWith(
    foregroundColor: WidgetStateProperty.all(
      const Color(0xFF6C6C78),
    ),
  );

  static ButtonStyle secondaryLight = baseStyle.copyWith(
    backgroundColor: WidgetStateProperty.all(Colors.white),
    foregroundColor: const WidgetStatePropertyAll(Colors.black),
    overlayColor: WidgetStateProperty.all(
      const Color(0xFFEAEAEB),
    ),
    shape: WidgetStateProperty.all(
      const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(28)),
        side: BorderSide(
          color: Color(0xFFC6C6CC)
        )
      ),
    ),
  );

  static ButtonStyle secondaryLightDisabled = secondaryLight.copyWith(
    foregroundColor: const WidgetStatePropertyAll(
      Color(0xFFC6C6CC),
    ),
    shape: WidgetStateProperty.all(
      const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(28)),
        side: BorderSide(
          color: Color(0xFFEAEAEB)
        )
      ),
    ),
  );

  static ButtonStyle secondaryDark = secondaryLight.copyWith(
    backgroundColor: const WidgetStatePropertyAll(Color(0xff52525b)),
    foregroundColor: const WidgetStatePropertyAll(Colors.white),
    overlayColor: const WidgetStatePropertyAll(
       Color(0xFFC6C6CC)
    ),
    shape: WidgetStateProperty.all(
      const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(28)),
        side: BorderSide(
          color: Color(0xFF6C6C78),
        )
      ),
    ),
  );

  static ButtonStyle secondaryDarkDisabled = secondaryDark.copyWith(
    backgroundColor: const WidgetStatePropertyAll(Color(0xff52525b)),
    foregroundColor: const WidgetStatePropertyAll(
      Color(0xFF6C6C78)
    ),
    shape: WidgetStateProperty.all(
      const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(28)),
        side: BorderSide(
          color: Color(0xFF404047),
        )
      ),
    ),
  );

}
