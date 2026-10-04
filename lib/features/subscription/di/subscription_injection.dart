import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

import '../../../core/services/firebase/firebase_firestore_service.dart';
import '../../../core/services/logger_service.dart';
import '../../../core/utils/env/env.dart';
import '../data/repositories/premium_status_firestore_repository.dart';
import '../data/repositories/revenue_cat_subscription_repository.dart';
import '../data/repositories/unavailable_subscription_repository.dart';
import '../domain/repositories/i_premium_status_repository.dart';
import '../domain/repositories/i_subscription_repository.dart';
import '../domain/usecases/get_plans_use_case.dart';
import '../domain/usecases/identify_subscriber_use_case.dart';
import '../domain/usecases/purchase_plan_use_case.dart';
import '../domain/usecases/restore_purchases_use_case.dart';
import '../domain/usecases/watch_premium_status_use_case.dart';
import '../presentation/bloc/premium_bloc/premium_bloc.dart';

void initSubscriptionFeature(GetIt getIt) {
  getIt.registerLazySingleton<ISubscriptionRepository>(
    () => kIsWeb
        ? UnavailableSubscriptionRepository()
        : RevenueCatSubscriptionRepository(
            env: getIt<Env>(),
            loggerService: getIt<LoggerService>(),
          ),
  );

  getIt.registerLazySingleton<IPremiumStatusRepository>(
    () => PremiumStatusFirestoreRepository(
      firestore: getIt<FirebaseFirestore>(),
      firebaseFirestoreService: getIt<FirebaseFirestoreService>(),
    ),
  );

  getIt.registerLazySingleton<GetPlansUseCase>(
    () => GetPlansUseCase(
      subscriptionRepository: getIt<ISubscriptionRepository>(),
    ),
  );
  getIt.registerLazySingleton<PurchasePlanUseCase>(
    () => PurchasePlanUseCase(
      subscriptionRepository: getIt<ISubscriptionRepository>(),
    ),
  );
  getIt.registerLazySingleton<RestorePurchasesUseCase>(
    () => RestorePurchasesUseCase(
      subscriptionRepository: getIt<ISubscriptionRepository>(),
    ),
  );
  getIt.registerLazySingleton<IdentifySubscriberUseCase>(
    () => IdentifySubscriberUseCase(
      subscriptionRepository: getIt<ISubscriptionRepository>(),
    ),
  );
  getIt.registerLazySingleton<WatchPremiumStatusUseCase>(
    () => WatchPremiumStatusUseCase(
      premiumStatusRepository: getIt<IPremiumStatusRepository>(),
    ),
  );

  getIt.registerLazySingleton<PremiumBloc>(
    () => PremiumBloc(
      identifySubscriberUseCase: getIt<IdentifySubscriberUseCase>(),
      watchPremiumStatusUseCase: getIt<WatchPremiumStatusUseCase>(),
    ),
  );
}
