import 'package:get_it/get_it.dart';

import '../../notifications/domain/usecases/get_notification_config_use_case.dart';
import '../../notifications/domain/usecases/save_notification_config_use_case.dart';
import '../presentation/bloc/settings_notification_bloc/settings_notification_bloc.dart';

void initSettingsFeature(GetIt getIt) {
  getIt.registerFactory<SettingsNotificationBloc>(
    () => SettingsNotificationBloc(
      getNotificationsConfigUseCase: getIt<GetNotificationsConfigUseCase>(),
      saveNotificationsConfigUseCase: getIt<SaveNotificationsConfigUseCase>(),
    ),
  );
}
