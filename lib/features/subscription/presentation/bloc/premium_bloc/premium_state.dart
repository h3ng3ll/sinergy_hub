part of 'premium_bloc.dart';

enum EPremiumStatus {
  initial,
  loading,
  ready,
  failed,
}

@freezed
sealed class PremiumState with _$PremiumState {
  const factory PremiumState({
    @Default(EPremiumStatus.initial) EPremiumStatus status,
    @Default(false) bool isPremium,
    PremiumStatus? premiumStatus,
    @Default('') String errorMessage,
  }) = _PremiumState;
}
