import 'package:dartz/dartz.dart';

import '../../../../core/models/exceptions.dart';
import '../models/subscription_plan/subscription_plan.dart';
import '../repositories/i_subscription_repository.dart';

class GetPlansUseCase {
  final ISubscriptionRepository _subscriptionRepository;

  GetPlansUseCase({
    required this._subscriptionRepository,
  });

  Future<Either<List<SubscriptionPlan>, Exceptions>> call() =>
      _subscriptionRepository.getPlans();
}
