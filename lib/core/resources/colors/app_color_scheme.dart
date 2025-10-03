import 'package:flutter/material.dart';
import 'app_colors.dart';

/// App color scheme.
@immutable
class AppColorScheme extends ThemeExtension<AppColorScheme> {
  /// The base color for app.
  final Color primary;

  /// The color of the elements that appears on top of a [primary].
  final Color onPrimary;

  /// A secondary color for the app.
  ///
  /// Can be used as an accent color for buttons, switches, labels, icons, etc.
  final Color secondary;

  /// The color of the elements that appears on top of a [secondary].
  final Color onSecondary;

  /// The color of inactive icon (in buttons/switchers... etc)
  final Color inactiveSecondary;

  /// Surface colors affect surfaces of components, such as cards, sheets, and menus.
  final Color surface;

  /// The color of the elements that appears on top of a [surface].
  final Color onSurface;

  /// The background color appears behind scrollable content.
  final Color background;

  /// The color of the elements that appears on top of a [background].
  final Color onBackground;

  /// Color for show errors.
  final Color error;

  /// The color of the elements that appears on top of a [error].
  final Color onError;

  /// Color for show selected items.
  final Color selectedItem;

  /// Color for show unselected items.
  final Color unselectedItem;

  final Color onSurfaceVariant;

  /// Base light theme of the app.
  AppColorScheme.light()
    : primary = AppColors.buttonBlue.value,
      onPrimary = AppColors.white.value,
      secondary = AppColors.white.value.withValues(
        alpha: 0.8,
      ),
      onSecondary = AppColors.mediumPurple.value,
      inactiveSecondary = AppColors.white.value,
      surface = AppColors.black.value,
      onSurface = AppColors.jacarta.value,
      background = AppColors.pinkBakerMiller.value,
      onBackground = AppColors.blueGray.value,
      error = AppColors.pinkCandy.value,
      onError = AppColors.white.value,
      // TODO: not used
      unselectedItem = AppColors.white.value,
      // TODO: not used
      selectedItem = AppColors.mediumPurple.value,
      onSurfaceVariant = AppColors.black.value; // TODO: not used

  /// Dark theme of the app. TODO: add colors for black theme
  AppColorScheme.dark()
    : primary = AppColors.white.value,
      onPrimary = AppColors.white.value,
      secondary = AppColors.white.value,
      onSecondary = AppColors.white.value,
      inactiveSecondary = AppColors.white.value,
      surface = AppColors.white.value,
      onSurface = AppColors.white.value,
      background = AppColors.white.value,
      onBackground = AppColors.white.value,
      error = AppColors.white.value,
      onError = AppColors.white.value,
      unselectedItem = AppColors.white.value,
      selectedItem = AppColors.white.value,
      onSurfaceVariant = AppColors.white.value;

  const AppColorScheme._({
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.inactiveSecondary,
    required this.surface,
    required this.onSurface,
    required this.background,
    required this.onBackground,
    required this.error,
    required this.onError,
    required this.selectedItem,
    required this.unselectedItem,
    required this.onSurfaceVariant,
  });

  @override
  // ignore: long-parameter-list
  ThemeExtension<AppColorScheme> copyWith({
    Color? primary,
    Color? onPrimary,
    Color? secondary,
    Color? onSecondary,
    Color? inactiveSecondary,
    Color? surface,
    Color? onSurface,
    Color? background,
    Color? onBackground,
    Color? error,
    Color? onError,
    Color? selectedItem,
    Color? unselectedItem,
    Color? onSurfaceVariant,
  }) {
    return AppColorScheme._(
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      secondary: secondary ?? this.secondary,
      onSecondary: onSecondary ?? this.onSecondary,
      inactiveSecondary: inactiveSecondary ?? this.inactiveSecondary,
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
      background: background ?? this.background,
      onBackground: onBackground ?? this.onBackground,
      error: error ?? this.error,
      onError: onError ?? this.onError,
      selectedItem: selectedItem ?? this.selectedItem,
      unselectedItem: unselectedItem ?? this.unselectedItem,
      onSurfaceVariant: onSurfaceVariant ?? this.onSurfaceVariant,
    );
  }

  @override
  ThemeExtension<AppColorScheme> lerp(
    ThemeExtension<AppColorScheme>? other,
    double t,
  ) {
    if (other is! AppColorScheme) return this;

    return copyWith(
      primary: Color.lerp(primary, other.primary, t),
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t),
      secondary: Color.lerp(secondary, other.secondary, t),
      onSecondary: Color.lerp(onSecondary, other.onSecondary, t),
      inactiveSecondary: Color.lerp(
        inactiveSecondary,
        other.inactiveSecondary,
        t,
      ),
      surface: Color.lerp(surface, other.surface, t),
      onSurface: Color.lerp(onSurface, other.onSurface, t),
      background: Color.lerp(background, other.background, t),
      onBackground: Color.lerp(onBackground, other.onBackground, t),
      error: Color.lerp(error, other.error, t),
      onError: Color.lerp(onError, other.onError, t),
      selectedItem: Color.lerp(selectedItem, other.selectedItem, t),
      unselectedItem: Color.lerp(unselectedItem, other.unselectedItem, t),
      onSurfaceVariant: Color.lerp(onSurfaceVariant, other.onSurfaceVariant, t),
    );
  }

  /// Return color scheme for app from context
  static AppColorScheme of(BuildContext context) =>
      Theme.of(context).extension<AppColorScheme>() ??
      _throwThemeExceptionFromFunc(context);
}

Never _throwThemeExceptionFromFunc(BuildContext context) =>
    throw Exception('$AppColorScheme не найдена в $context');
