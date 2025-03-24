import 'package:flutter/material.dart';

abstract class AppPalette {

  // Black
  static const primary = Color(0xFFF39814);
  static const secondary = Color(0xFF81898F);
  // Red
  static const red = Colors.red;
  static const imperialRed = Color(0xFFE54B4B);

  // White
  static const seashellWhite = Color(0xFFF7EBE8);
  static const pureWhite = Color(0xFFFFFFFF);


  // Black
  static const pureBlack = Color(0xFF000000);
  static const offBlack = Color(0xFF1F2121);

  // Green
  static const lemonGreen = Color(0xFF6FBE45);


  // Input Hint
  static const inputHint = Color(0xFF81898F);



  static const borderGradient = Color(0x709083B2);

  // Grey
  static const grey = _GreyColors();
}

/// Alternative way to group colors in the palette.
/// 
/// The downside is that you won't be able
/// to use them as constructor default values,
/// because they are not constants.
///
/// Usage example: `AppPalette.grey.grey50`.
class _GreyColors {
  const _GreyColors();

  final grey = const Color(0xFF898D8F);
  final grey200 = const Color(0xFF303131);
  final grey300 = const Color(0xFFCACBCA);
  final grey50 = const Color(0xFFFAFAFA);
  final grey20 = const Color(0xFF5E6B6D);
  final grey100 = const Color(0xFFF5F5F5);
  final grey400 = const Color(0xFF2C2E30);
  final grey150 = const Color(0xFF81898F);
  final grey250 = const Color(0xFF131616);
  final boxGrey = const Color(0xFF121A19);
  final grey350 = const Color(0xFFA5AAAB);
  final faintGrey = const Color(0xFF303131);
}
