import 'package:dartz/dartz.dart';

import '../../../../core/models/exceptions.dart';
import '../repositories/i_subscription_repository.dart';

class RestorePurchasesUseCase {
  final ISubscriptionRepository _subscriptionRepository;

  RestorePurchasesUseCase({
    required this._subscriptionRepository,
  });

  Future<Either<ERestoreOutcome, Exceptions>> call() =>
      _subscriptionRepository.restore();
}
