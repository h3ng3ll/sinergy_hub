import 'package:dartz/dartz.dart';

import '../../../../core/models/exceptions.dart';
import '../models/subscription_plan/subscription_plan.dart';

enum EPurchaseOutcome {
  purchased,
  cancelled,
}

enum ERestoreOutcome {
  restored,
  nothingToRestore,
}

/// The RevenueCat side of the subscription feature.
///
/// Never decides entitlement — that is read from Firestore via
/// [IPremiumStatusRepository]. This repository only drives the purchase
/// flow itself (offerings, purchase, restore, subscriber identity).
abstract class ISubscriptionRepository {
  /// False on web, and false whenever the platform API key is empty.
  bool get isAvailable;

  Future<void> configure();

  Future<void> logIn(String uid);

  Future<void> logOut();

  Future<Either<List<SubscriptionPlan>, Exceptions>> getPlans();

  Future<Either<EPurchaseOutcome, Exceptions>> purchase(String planId);

  Future<Either<ERestoreOutcome, Exceptions>> restore();

  /// Where the user manages or cancels their subscription. Store
  /// subscriptions can only be cancelled in the App Store / Google Play, so
  /// this is the store's own management page.
  Future<Either<Uri, Exceptions>> getManagementUrl();
}
