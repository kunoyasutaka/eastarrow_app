import 'package:flutter/material.dart';

class AppColors {
  static const MaterialColor ocher = MaterialColor(
    _ocherPrimaryValue,
    <int, Color>{
      50: Color(0xFFF6F3EC),
      100: Color(0xFFE9E1CE),
      200: Color(0xFFDACDAE),
      300: Color(0xFFCBB88E),
      400: Color(0xFFC0A975),
      500: Color(_ocherPrimaryValue),
      600: Color(0xFFAE9255),
      700: Color(0xFFA5884B),
      800: Color(0xFF9D7E41),
      900: Color(0xFF8D6C30),
    },
  );

  static const int _ocherPrimaryValue = 0xFFB59A5D;

  static const MaterialColor darkRed = MaterialColor(
    _darkRedPrimaryValue,
    <int, Color>{
      50: Color(0xFFF9EAEA),
      100: Color(0xFFEFCBCB),
      200: Color(0xFFE5A8A8),
      300: Color(0xFFDB8585),
      400: Color(0xFFD36B6B),
      500: Color(_darkRedPrimaryValue),
      600: Color(0xFFC64A4A),
      700: Color(0xFFBE4040),
      800: Color(0xFFB83737),
      900: Color(0xFFAC2727),
    },
  );

  static const int _darkRedPrimaryValue = 0xFFCB5151;

  static const Color navyBlue = Color(0xFF222B3D);

  static const Color white = Color(0xFFFFFFFF);

  static const Color lightGrey = Color(0xFFF7F7F7);

  static const Color grey = Color(0xFF4D4D4D);
}
