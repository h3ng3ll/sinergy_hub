import 'package:get_it/get_it.dart';

import '../../../core/services/firebase/firebase_firestore_service.dart';
import '../../../core/services/firebase/firebase_messaging_service.dart';
import '../../auth/domain/repostories/i_auth_repository.dart';
import '../data/repositories/notification_config_firebase_repository.dart';
import '../data/repositories/notification_firebase_repository.dart';
import '../domain/repositories/i_notification_config_repository.dart';
import '../domain/repositories/i_notification_repository.dart';
import '../domain/usecases/get_notification_config_use_case.dart';
import '../domain/usecases/get_notifications_use_case.dart';
import '../domain/usecases/register_current_device_token_use_case.dart';
import '../domain/usecases/save_notification_config_use_case.dart';
import '../domain/usecases/save_notification_use_case.dart';
import '../presentation/bloc/notification_config_bloc/notification_config_bloc.dart';

void initNotificationFeature(GetIt getIt) {
  getIt.registerLazySingleton<INotificationRepository>(
    () => NotificationFirebaseRepository(
      firebaseFirestoreService: getIt<FirebaseFirestoreService>(),
    ),
  );
  getIt.registerLazySingleton<INotificationConfigRepository>(
    () => NotificationConfigFirebaseRepository(
      firebaseFirestoreService: getIt<FirebaseFirestoreService>(),
    ),
  );
  getIt.registerLazySingleton<SaveNotificationUseCase>(
    () => SaveNotificationUseCase(
      notificationRepository: getIt<INotificationRepository>(),
      authRepository: getIt<IAuthRepository>(),
    ),
  );
  getIt.registerLazySingleton<GetNotificationsUseCase>(
    () => GetNotificationsUseCase(
      notificationRepository: getIt<INotificationRepository>(),
      authRepository: getIt<IAuthRepository>(),
    ),
  );
  getIt.registerLazySingleton<GetNotificationsConfigUseCase>(
    () => GetNotificationsConfigUseCase(
      notificationConfigRepository: getIt<INotificationConfigRepository>(),
      authRepository: getIt<IAuthRepository>(),
    ),
  );
  getIt.registerLazySingleton<SaveNotificationsConfigUseCase>(
    () => SaveNotificationsConfigUseCase(
      notificationConfigRepository: getIt<INotificationConfigRepository>(),
      authRepository: getIt<IAuthRepository>(),
    ),
  );
  getIt.registerLazySingleton<RegisterCurrentDeviceTokenUseCase>(
    () => RegisterCurrentDeviceTokenUseCase(
      notificationConfigRepository: getIt<INotificationConfigRepository>(),
      authRepository: getIt<IAuthRepository>(),
      firebaseMessagingService: getIt<FirebaseMessagingService>(),
    ),
  );
 getIt.registerLazySingleton<NotificationConfigBloc>(
    () =>  NotificationConfigBloc(
      getNotificationsConfigUseCase:
      getIt<GetNotificationsConfigUseCase>(),
      saveNotificationsConfigUseCase:
      getIt<SaveNotificationsConfigUseCase>(),
      registerCurrentDeviceTokenUseCase:
      getIt<RegisterCurrentDeviceTokenUseCase>(),
    )
  );
}
