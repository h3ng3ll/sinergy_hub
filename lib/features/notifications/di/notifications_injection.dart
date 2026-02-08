import 'package:get_it/get_it.dart';

import '../../../core/services/firebase/firebase_firestore_service.dart';
import '../data/repositories/notification_firebase_repository.dart';
import '../domain/repositories/i_notification_repository.dart';
import '../domain/usecases/get_notifications_use_case.dart';
import '../domain/usecases/save_notification_use_case.dart';

void initNotificationFeature(GetIt getIt) {
  getIt.registerLazySingleton<INotificationRepository>(
    () => NotificationFirebaseRepository(
      firebaseFirestoreService: getIt<FirebaseFirestoreService>(),
    ),
  );
  getIt.registerLazySingleton<SaveNotificationUseCase>(
    () => SaveNotificationUseCase(
      notificationRepository: getIt<INotificationRepository>(),
    ),
  );
  getIt.registerLazySingleton<GetNotificationsUseCase>(
    () => GetNotificationsUseCase(
      notificationRepository: getIt<INotificationRepository>(),
    ),
  );
}
