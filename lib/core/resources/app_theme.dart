import 'package:flutter/material.dart';
import 'text/app_text_theme.dart';
import 'colors/app_color_scheme.dart';

abstract class AppThemeData {
  static final _lightColorScheme = AppColorScheme.light();
  static final _darkColorScheme = AppColorScheme.dark();
  static final _textTheme = AppTextTheme.base();

  static final light = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: const Color(0xffFDFDFD),
    appBarTheme: const AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: Color(0xff1C1C1C)),
    ),
    textSelectionTheme: const TextSelectionThemeData(
        // cursorColor: Constants.cursorColor,
        // selectionHandleColor: Constants.bubbleUnderCursorColor,
        ),
    colorScheme: ColorScheme(

      brightness: Brightness.light,
      primary: _lightColorScheme.primary,
      onPrimary: _lightColorScheme.onPrimary,
      secondary: _lightColorScheme.secondary,
      onSecondary: _lightColorScheme.onSecondary,
      error: _lightColorScheme.error,
      onError: _lightColorScheme.onError,
      surface: _lightColorScheme.surface,
      onSurface: _lightColorScheme.onSurface,
      onSurfaceVariant: _lightColorScheme.onSurfaceVariant,
    ),
    brightness: Brightness.light,
    primaryColor: Colors.black,
    extensions: [_textTheme, _lightColorScheme],
  );

  static ThemeData dark = ThemeData(
    useMaterial3: false,
    scaffoldBackgroundColor: const Color(0xff1C1C1C),
    appBarTheme: const AppBarTheme(
      color: Color(0xff1C1C1C),
      iconTheme: IconThemeData(color: Color(0xffFDFDFD)),
    ),
    textSelectionTheme: const TextSelectionThemeData(
        // cursorColor: Constants.cursorColor,
        // selectionHandleColor: Constants.bubbleUnderCursorColor,
        ),
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: _darkColorScheme.primary,
      onPrimary: _darkColorScheme.onPrimary,
      secondary: _darkColorScheme.secondary,
      onSecondary: _darkColorScheme.onSecondary,
      error: _darkColorScheme.error,
      onError: _darkColorScheme.onError,
      surface: _darkColorScheme.surface,
      onSurface: _darkColorScheme.onSurface,
      onSurfaceVariant: _darkColorScheme.onSurfaceVariant,
    ),
    brightness: Brightness.dark,
    primaryColor: const Color(0xffFDFDFD),
    extensions: [_textTheme, _darkColorScheme],
  );
}
