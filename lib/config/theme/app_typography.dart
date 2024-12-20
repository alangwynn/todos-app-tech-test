import 'package:flutter/material.dart';

const fontColor =
    MaterialColor(0xFF252529, {400: Color(0xff52525b), 500: Color(0xFF252529)});

class AppTypography {
  static const s = TextStyle(
    fontSize: 10.0,
    fontWeight: FontWeight.w400,
    color: fontColor,
    height: 1.6,
    letterSpacing: .3,
  );

  static const m = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    color: fontColor,
    height: 1.33,
    letterSpacing: .24,
  );

  static const l = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: fontColor,
    height: 1.42,
    letterSpacing: .14,
  );

  /// Get al styles from Body foundations
  List<TextStyle> values() => [s, m, l];

  /// Get al name of Body foundations
  List<String> names() => ['s', 'm', 'l'];
}
