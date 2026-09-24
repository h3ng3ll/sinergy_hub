import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscription_plan.freezed.dart';

enum EPlanPeriod {
  weekly,
  monthly,
  annual,
  lifetime,
  unknown,
}

@freezed
sealed class SubscriptionPlan with _$SubscriptionPlan {
  const factory SubscriptionPlan({
    /// The store package/product identifier — used to start a purchase.
    required String id,
    required String title,
    required String priceString,
    required EPlanPeriod period,
    String? introOffer,
  }) = _SubscriptionPlan;
}
