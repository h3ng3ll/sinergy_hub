import 'notification_config_failures.dart';

class RegisterDeviceTokenFailure implements NotificationConfigFailure {
  @override
  final String message;

  RegisterDeviceTokenFailure({
    this.message = 'Failed to register device token. Try again',
  });
}
