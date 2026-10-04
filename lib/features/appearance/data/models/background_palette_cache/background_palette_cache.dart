import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/background_palette/background_palette.dart';

part 'background_palette_cache.freezed.dart';

/// Hive copy of the background palette as ARGB ints. Both `null` means the
/// user is on the default palette — stored explicitly so the backend is not
/// re-read on every launch.
@freezed
sealed class BackgroundPaletteCache with _$BackgroundPaletteCache {
  const BackgroundPaletteCache._();

  const factory BackgroundPaletteCache({
    int? primary,
    int? secondary,
  }) = _BackgroundPaletteCache;

  factory BackgroundPaletteCache.fromPalette(BackgroundPalette? palette) =>
      BackgroundPaletteCache(
        primary: palette?.primary.toARGB32(),
        secondary: palette?.secondary.toARGB32(),
      );

  BackgroundPalette? toPalette() {
    final primary = this.primary;
    final secondary = this.secondary;
    if (primary == null || secondary == null) return null;
    return BackgroundPalette(
      primary: Color(primary),
      secondary: Color(secondary),
    );
  }
}
