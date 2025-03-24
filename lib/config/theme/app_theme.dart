import 'package:flutter/material.dart';
import 'package:moniepoint_test/config/theme/app_palette.dart';

class AppTheme {

  static final lightTheme = ThemeData(
      fontFamily: 'EuclidCircularA',
      scaffoldBackgroundColor: Colors.white,
      primaryColor: AppPalette.primary,
      secondaryHeaderColor: Colors.white,
      buttonTheme: const ButtonThemeData(
        buttonColor: AppPalette.primary,
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppPalette.primary,
      ),
     hintColor: const Color(0xFF797A7A),
      colorScheme: const ColorScheme.light().copyWith(primary: AppPalette.primary, secondary: Colors.white),
      primaryColorLight: Colors.transparent,
      primaryColorDark: Colors.white,

  );
}