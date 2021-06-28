import 'dart:math';

import 'package:flutter/material.dart';

class ColorUtils {
  static Color primary = Color(0xFF4BBD15);
  static Color secondary = Color(0xFF129800);
  static Color onBoardingScaffoldColor = Color(0XFFFDFFFE);

  MaterialColor primarySwatch() {
    return MaterialColor(primary.value, {
      50: tintColor(primary, 0.9),
      100: tintColor(primary, 0.8),
      200: tintColor(primary, 0.6),
      300: tintColor(primary, 0.4),
      400: tintColor(primary, 0.2),
      500: primary,
      600: shadeColor(primary, 0.1),
      700: shadeColor(primary, 0.2),
      800: shadeColor(primary, 0.3),
      900: shadeColor(primary, 0.4),
    });
  }

  int tintValue(int value, double factor) =>
      max(0, min((value + ((255 - value) * factor)).round(), 255));

  Color tintColor(Color color, double factor) => Color.fromRGBO(
      tintValue(color.red, factor),
      tintValue(color.green, factor),
      tintValue(color.blue, factor),
      1);

  int shadeValue(int value, double factor) =>
      max(0, min(value - (value * factor).round(), 255));

  Color shadeColor(Color color, double factor) => Color.fromRGBO(
      shadeValue(color.red, factor),
      shadeValue(color.green, factor),
      shadeValue(color.blue, factor),
      1);
}
