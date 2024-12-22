import 'package:flutter/material.dart';
import 'package:technical_test_flutter_sr/config/theme/themes.dart';

class AppTheme {

  final bool isDarkMode;

  AppTheme({
    this.isDarkMode = false,
  });

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    appBarTheme: const AppBarTheme(
      centerTitle: false
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: const Color(0xFF268BFF),
      selectionColor: const Color(0xFF268BFF).withOpacity(0.25),
      selectionHandleColor: const Color(0xFF268BFF).withOpacity(0.25)
    ),
    scaffoldBackgroundColor: isDarkMode ? const Color(0xFF252529) : const Color(0xFFF7F7F7),
    bottomSheetTheme: const BottomSheetThemeData(
      surfaceTintColor: Colors.white,
    ),
    textTheme: const TextTheme(
      bodySmall: AppTypography.s,
      bodyMedium: AppTypography.m,
      bodyLarge: AppTypography.l,
    ),
    buttonTheme: const ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(28)),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(style: AppButtonStyles.primaryLight),
    filledButtonTheme:
        FilledButtonThemeData(style: AppButtonStyles.primaryLight),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: AppButtonStyles.primaryLight,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: AppButtonStyles.primaryLight,
    ),
    inputDecorationTheme: AppInputDecorationTheme.normal,
    dropdownMenuTheme: DropdownMenuThemeData(
      inputDecorationTheme: AppInputDecorationTheme.normal,
    )
  );

  AppTheme copyWith({
    bool? isDarkMode,
  }) => AppTheme(
    isDarkMode: isDarkMode ?? this.isDarkMode
  );
  
}
