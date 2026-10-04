part of 'background_palette_bloc.dart';

@freezed
sealed class BackgroundPaletteEvent with _$BackgroundPaletteEvent {
  /// Starts following the signed-in user's premium status. Dispatched once,
  /// when the app starts.
  const factory BackgroundPaletteEvent.start() = _Start;

  /// Loads [uid]'s palette (local first, then backend).
  const factory BackgroundPaletteEvent.init({
    required String uid,
  }) = _Init;

  const factory BackgroundPaletteEvent.reset() = _Reset;

  /// Sets one color; the other keeps its current (or default) value.
  const factory BackgroundPaletteEvent.setPrimary({
    required Color color,
  }) = _SetPrimary;

  const factory BackgroundPaletteEvent.setSecondary({
    required Color color,
  }) = _SetSecondary;

  const factory BackgroundPaletteEvent.resetPalette() = _ResetPalette;
}
