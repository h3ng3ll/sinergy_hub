import 'notification_config_failures.dart';

class LoadNotificationConfigFailure implements NotificationConfigFailure {
  @override
  final String message;

  LoadNotificationConfigFailure({
    this.message = 'Failed to load notification config. Try again',
  });
}
