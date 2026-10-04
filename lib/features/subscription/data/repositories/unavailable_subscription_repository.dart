import 'package:dartz/dartz.dart';

import '../../../../core/models/exceptions.dart';
import '../../domain/failures/subscription_failures.dart';
import '../../domain/models/subscription_plan/subscription_plan.dart';
import '../../domain/repositories/i_subscription_repository.dart';

/// Used on web, and as a safe fallback wherever RevenueCat must never be
/// touched. Every call reports [PurchasesUnavailableFailure] instead of
/// reaching the platform channel.
class UnavailableSubscriptionRepository implements ISubscriptionRepository {
  @override
  bool get isAvailable => false;

  @override
  Future<void> configure() async {}

  @override
  Future<void> logIn(String uid) async {}

  @override
  Future<void> logOut() async {}

  @override
  Future<Either<List<SubscriptionPlan>, Exceptions>> getPlans() async =>
      Right(PurchasesUnavailableFailure());

  @override
  Future<Either<EPurchaseOutcome, Exceptions>> purchase(
    String planId,
  ) async => Right(PurchasesUnavailableFailure());

  @override
  Future<Either<ERestoreOutcome, Exceptions>> restore() async =>
      Right(PurchasesUnavailableFailure());

  @override
  Future<Either<Uri, Exceptions>> getManagementUrl() async =>
      Right(PurchasesUnavailableFailure());
}
