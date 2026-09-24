part of 'paywall_bloc.dart';

enum EPaywallStatus {
  initial,
  loading,
  ready,
  empty,
  unavailable,
  purchasing,
  restoring,
  purchased,
  restored,
  nothingToRestore,
  cancelled,
  failed,
}

@freezed
sealed class PaywallState with _$PaywallState {
  const factory PaywallState({
    @Default(EPaywallStatus.initial) EPaywallStatus status,
    @Default(<SubscriptionPlan>[]) List<SubscriptionPlan> plans,
    String? selectedPlanId,
    @Default('') String errorMessage,
  }) = _PaywallState;
}
