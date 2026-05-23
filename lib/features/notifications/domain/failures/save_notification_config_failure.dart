import 'notification_config_failures.dart';

class SaveNotificationConfigFailure implements NotificationConfigFailure {
  @override
  final String message;

  SaveNotificationConfigFailure({
    this.message = 'Failed to save notification config. Try again',
  });
}
