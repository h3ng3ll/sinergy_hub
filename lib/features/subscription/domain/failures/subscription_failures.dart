import '../../../../core/models/exceptions.dart';

/// Purchases are unavailable — either running on web, or the platform's
/// RevenueCat API key hasn't been configured yet.
class PurchasesUnavailableFailure implements Exceptions {
  @override
  final String message;

  PurchasesUnavailableFailure({
    this.message = 'Premium is not available right now.',
  });
}

/// No current offering, or the current offering has no packages configured
/// in the RevenueCat dashboard.
class NoPlansFoundFailure implements Exceptions {
  @override
  final String message;

  NoPlansFoundFailure({
    this.message = 'No subscription plans are available right now.',
  });
}

class PurchaseFailedFailure implements Exceptions {
  @override
  final String message;

  PurchaseFailedFailure([String? details])
    : message = (details == null || details.isEmpty)
          ? 'The purchase could not be completed. Please try again.'
          : 'The purchase could not be completed: $details';
}

class RestoreFailedFailure implements Exceptions {
  @override
  final String message;

  RestoreFailedFailure([String? details])
    : message = (details == null || details.isEmpty)
          ? 'Could not restore purchases. Please try again.'
          : 'Could not restore purchases: $details';
}

/// The store reported the payment as pending approval (e.g. Google Play
/// pending transactions) rather than completed or cancelled.
class PurchasePendingFailure implements Exceptions {
  @override
  final String message;

  PurchasePendingFailure({
    this.message = 'Your payment is pending approval.',
  });
}
