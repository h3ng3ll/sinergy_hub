import 'package:dartz/dartz.dart';

import '../../../../core/models/exceptions.dart';
import '../repositories/i_subscription_repository.dart';

class PurchasePlanUseCase {
  final ISubscriptionRepository _subscriptionRepository;

  PurchasePlanUseCase({
    required this._subscriptionRepository,
  });

  Future<Either<EPurchaseOutcome, Exceptions>> call({
    required String planId,
  }) => _subscriptionRepository.purchase(planId);
}
