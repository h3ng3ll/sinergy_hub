import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import '../../../../core/models/exceptions.dart';
import '../../../../core/services/logger_service.dart';
import '../../../../core/utils/env/env.dart';
import '../../domain/failures/subscription_failures.dart';
import '../../domain/models/subscription_plan/subscription_plan.dart';
import '../../domain/repositories/i_subscription_repository.dart';

/// Must match the entitlement identifier configured in the RevenueCat
/// dashboard exactly — this project's dashboard uses `hengell_pro`, not the
/// generic `premium` placeholder. See docs/subscription_backend_contract.md.
const String kPremiumEntitlementId = 'sinergyhub_pro';

class RevenueCatSubscriptionRepository implements ISubscriptionRepository {
  final Env _env;
  final LoggerService _loggerService;
  final String _offerName = 'synergy_hub_premium';
  bool _configured = false;

  RevenueCatSubscriptionRepository({
    required this._env,
    required this._loggerService,
  });

  String get _apiKey => Platform.isIOS
      ? _env.revenueCatAppleApiKey()
      : _env.revenueCatGoogleApiKey();

  /// False until the platform API key is provided — the key arrives later
  /// (see the plan's "API keys will come later" assumption), so the app must
  /// keep working with an empty key rather than crash on every call.
  @override
  bool get isAvailable => _apiKey.isNotEmpty;

  @override
  Future<void> configure() async {
    if (!isAvailable) return;
    try {
      await Purchases.configure(
        PurchasesConfiguration(_apiKey),
      );
      _configured = true;
    } catch (_) {
      _configured = false;
    }
  }

  @override
  Future<void> logIn(String uid) async {
    if (!isAvailable || !_configured) return;
    try {
      await Purchases.logIn(uid);
    } catch (_) {
      // Identifying the subscriber is best-effort: a failure here must not
      // block sign-in. The next successful call re-attempts it implicitly
      // because RevenueCat keeps the last-known app user id.
    }
  }

  @override
  Future<void> logOut() async {
    if (!isAvailable || !_configured) return;
    try {
      // RevenueCat throws when logOut() is called on an anonymous user.
      if (await Purchases.isAnonymous) return;
      await Purchases.logOut();
    } catch (_) {}
  }

  @override
  Future<Either<List<SubscriptionPlan>, Exceptions>> getPlans() async {
    if (!isAvailable) return Right(PurchasesUnavailableFailure());
    try {
      final offerings = await Purchases.getOfferings();
      final current = offerings.all[_offerName];
      if (current == null || current.availablePackages.isEmpty) {
        return Right(NoPlansFoundFailure());
      }
      return Left(
        current.availablePackages.map(_toSubscriptionPlan).toList(),
      );
    } catch (e) {
      _loggerService.error(
        'Failed to get products',
        error: e,
      );
      return Right(NoPlansFoundFailure());
    }
  }

  @override
  Future<Either<EPurchaseOutcome, Exceptions>> purchase(
    String planId,
  ) async {
    if (!isAvailable) return Right(PurchasesUnavailableFailure());
    try {
      final offerings = await Purchases.getOfferings();
      final package = _findPackage(offerings, planId);
      if (package == null) return Right(NoPlansFoundFailure());

      final result = await Purchases.purchase(
        PurchaseParams.package(package),
      );
      final isActive = result.customerInfo.entitlements.active.containsKey(
        kPremiumEntitlementId,
      );
      if (!isActive) {
        return Right(
          PurchaseFailedFailure(
            'Purchase completed but the "$kPremiumEntitlementId" entitlement is not active',
          ),
        );
      }
      return const Left(EPurchaseOutcome.purchased);
    } on PlatformException catch (e) {
      final code = PurchasesErrorHelper.getErrorCode(e);
      if (code == PurchasesErrorCode.purchaseCancelledError) {
        return const Left(EPurchaseOutcome.cancelled);
      }
      if (code == PurchasesErrorCode.paymentPendingError) {
        return Right(PurchasePendingFailure());
      }
      return Right(PurchaseFailedFailure(e.message));
    } catch (e) {
      return Right(PurchaseFailedFailure(e.toString()));
    }
  }

  @override
  Future<Either<ERestoreOutcome, Exceptions>> restore() async {
    if (!isAvailable) return Right(PurchasesUnavailableFailure());
    try {
      final customerInfo = await Purchases.restorePurchases();
      final isActive = customerInfo.entitlements.active.containsKey(
        kPremiumEntitlementId,
      );
      return Left(
        isActive ? ERestoreOutcome.restored : ERestoreOutcome.nothingToRestore,
      );
    } catch (e) {
      return Right(RestoreFailedFailure(e.toString()));
    }
  }

  Package? _findPackage(Offerings offerings, String planId) {
    for (final package
        in offerings.all[_offerName]?.availablePackages ?? const <Package>[]) {
      if (package.identifier == planId) return package;
    }
    return null;
  }

  SubscriptionPlan _toSubscriptionPlan(Package package) {
    return SubscriptionPlan(
      id: package.identifier,
      title: package.storeProduct.title,
      priceString: package.storeProduct.priceString,
      period: _periodFromPackageType(package.packageType),
      introOffer: package.storeProduct.introductoryPrice?.priceString,
    );
  }

  EPlanPeriod _periodFromPackageType(PackageType type) {
    switch (type) {
      case PackageType.weekly:
        return EPlanPeriod.weekly;
      case PackageType.monthly:
        return EPlanPeriod.monthly;
      case PackageType.annual:
        return EPlanPeriod.annual;
      case PackageType.lifetime:
        return EPlanPeriod.lifetime;
      case PackageType.sixMonth:
      case PackageType.threeMonth:
      case PackageType.twoMonth:
      case PackageType.custom:
      case PackageType.unknown:
        return EPlanPeriod.unknown;
    }
  }
}
