part of 'paywall_bloc.dart';

extension PaywallStateX on PaywallState {
  bool get isInitial => status == EPaywallStatus.initial;

  bool get isLoading => status == EPaywallStatus.loading;

  bool get isReady => status == EPaywallStatus.ready;

  bool get isEmpty => status == EPaywallStatus.empty;

  bool get isUnavailable => status == EPaywallStatus.unavailable;

  bool get isPurchasing => status == EPaywallStatus.purchasing;

  bool get isRestoring => status == EPaywallStatus.restoring;

  bool get isPurchased => status == EPaywallStatus.purchased;

  bool get isRestored => status == EPaywallStatus.restored;

  bool get isNothingToRestore => status == EPaywallStatus.nothingToRestore;

  bool get isCancelled => status == EPaywallStatus.cancelled;

  bool get isFailed => status == EPaywallStatus.failed;

  /// True while a network call this screen started is still in flight —
  /// used to ignore taps rather than let them queue up.
  bool get isBusy => isLoading || isPurchasing || isRestoring;

  SubscriptionPlan? get selectedPlan {
    final id = selectedPlanId;
    if (id == null) return null;
    for (final plan in plans) {
      if (plan.id == id) return plan;
    }
    return null;
  }
}
