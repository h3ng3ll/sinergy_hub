part of 'tinder_card_cubit.dart';

enum TinderCardStatus {
  none,
  liked,
  reject,
}

@freezed
sealed class TinderCardState with _$TinderCardState {
  const factory TinderCardState({
    @Default(Offset.zero) Offset position,
    @Default(false) isDragging,
    @Default(0.0) double rotation,
    @Default(Size.zero) Size cardSize,
    @Default(TinderCardStatus.none) TinderCardStatus status,
  }) = _TinderCardState;
}
