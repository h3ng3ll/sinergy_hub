part of 'background_palette_bloc.dart';

extension BackgroundPaletteStateX on BackgroundPaletteState {
  bool get isInitial => status == EBackgroundPaletteStatus.initial;

  bool get isLoading => status == EBackgroundPaletteStatus.loading;

  bool get isReady => status == EBackgroundPaletteStatus.ready;

  bool get isFailed => status == EBackgroundPaletteStatus.failed;

  bool get hasCustomPalette => palette != null;

  /// The palette is a Premium feature: it applies only while Premium is
  /// active, and comes back automatically on renewal.
  BackgroundPalette? get effectivePalette => isPremium ? palette : null;

  List<Color> get shaderColors =>
      effectivePalette?.shaderColors ?? kDefaultBackgroundShaderColors;

  Color get primaryColor =>
      palette?.primary ?? kDefaultBackgroundShaderColors[0];

  Color get secondaryColor =>
      palette?.secondary ?? kDefaultBackgroundShaderColors[1];
}
