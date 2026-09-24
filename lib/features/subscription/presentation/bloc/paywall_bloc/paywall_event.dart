part of 'paywall_bloc.dart';

@freezed
class PaywallEvent with _$PaywallEvent {
  const factory PaywallEvent.loadPlans() = _LoadPlans;

  const factory PaywallEvent.selectPlan({
    required String planId,
  }) = _SelectPlan;

  /// No payload — purchases whatever plan is currently selected.
  const factory PaywallEvent.purchase() = _Purchase;

  const factory PaywallEvent.restore() = _Restore;
}
