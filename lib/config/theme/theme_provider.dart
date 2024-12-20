import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:technical_test_flutter_sr/config/theme/app_theme.dart';


// Objeto de tipo AppTheme (custom)
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

class ThemeNotifier extends StateNotifier<AppTheme> {
  
  // ThemeNotifier(super.state);
  ThemeNotifier() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

}