
import 'package:flutter/material.dart';
import 'package:technical_test_flutter_sr/l10n/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
