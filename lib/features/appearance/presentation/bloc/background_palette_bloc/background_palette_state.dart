part of 'background_palette_bloc.dart';

enum EBackgroundPaletteStatus {
  initial,
  loading,
  ready,
  failed,
}

@freezed
sealed class BackgroundPaletteState with _$BackgroundPaletteState {
  const factory BackgroundPaletteState({
    @Default(EBackgroundPaletteStatus.initial) EBackgroundPaletteStatus status,
    String? uid,

    /// The stored palette; `null` = default.
    BackgroundPalette? palette,
    @Default(false) bool isPremium,
    @Default('') String errorMessage,
  }) = _BackgroundPaletteState;
}
