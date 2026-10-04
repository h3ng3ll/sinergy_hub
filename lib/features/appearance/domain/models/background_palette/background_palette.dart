import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/utils/converters/color_serializable.dart';

part 'background_palette.freezed.dart';

part 'background_palette.g.dart';

/// The original `ve.frag` gradient, kept exactly so the default background
/// looks the same as before palettes existed.
const List<Color> kDefaultBackgroundShaderColors = [
  Color.from(alpha: 1.0, red: 0.6, green: 0.4, blue: 0.95),
  Color.from(alpha: 1.0, red: 0.85, green: 0.35, blue: 0.75),
  Color.from(alpha: 1.0, red: 0.95, green: 0.58, blue: 0.98),
  Color.from(alpha: 1.0, red: 0.4, green: 0.5, blue: 0.92),
];

/// How far the derived 3rd / 4th shader colors move from the user's two
/// picks — enough variation for the waves without leaving the palette.
const double _kHighlightMix = 0.35;
const double _kAccentMix = 0.3;
const Color _kHighlight = Color(0xFFFFFFFF);
const Color _kAccent = Color(0xFF4060E0);

/// The two colors a Premium user picked for the animated background.
@freezed
sealed class BackgroundPalette with _$BackgroundPalette {
  const BackgroundPalette._();

  const factory BackgroundPalette({
    @ColorSerializable() required Color primary,
    @ColorSerializable() required Color secondary,
  }) = _BackgroundPalette;

  factory BackgroundPalette.fromJson(Map<String, dynamic> json) =>
      _$BackgroundPaletteFromJson(json);

  /// The 4 shader colors: the two picks plus a lighter secondary and a
  /// blue-shifted primary, mirroring the roles of the default gradient.
  List<Color> get shaderColors => [
    primary,
    secondary,
    Color.lerp(secondary, _kHighlight, _kHighlightMix)!,
    Color.lerp(primary, _kAccent, _kAccentMix)!,
  ];
}
