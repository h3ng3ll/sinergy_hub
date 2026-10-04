import 'package:dartz/dartz.dart';

import '../../../../core/models/exceptions.dart';
import '../repositories/i_subscription_repository.dart';

class GetSubscriptionManagementUrlUseCase {
  final ISubscriptionRepository _subscriptionRepository;

  GetSubscriptionManagementUrlUseCase({
    required this._subscriptionRepository,
  });

  Future<Either<Uri, Exceptions>> call() =>
      _subscriptionRepository.getManagementUrl();
}
