import 'package:flutter_test/flutter_test.dart';
import 'package:sinergy_hub/features/notifications/domain/models/notification_config/notification_config.dart';

void main() {
  group('NotificationConfig serialization', () {
    test('default fcmTokens is an empty map', () {
      const config = NotificationConfig();
      expect(config.fcmTokens, isEmpty);
      expect(config.fcmTokens, isA<Map<String, String>>());
    });

    test('toJson emits fcmTokens as a map keyed by platform', () {
      const config = NotificationConfig(
        fcmTokens: {'android': 'tok-a', 'ios': 'tok-i'},
        enabledNotifications: true,
      );

      final json = config.toJson();

      expect(json['fcmTokens'], {'android': 'tok-a', 'ios': 'tok-i'});
      expect(json['enabledNotifications'], true);
    });

    test('fromJson parses a per-platform map', () {
      final config = NotificationConfig.fromJson({
        'fcmTokens': {'android': 'tok-a'},
        'enabledNotifications': false,
      });

      expect(config.fcmTokens, {'android': 'tok-a'});
      expect(config.enabledNotifications, false);
    });

    test('fromJson falls back to empty map when fcmTokens missing', () {
      final config = NotificationConfig.fromJson({
        'enabledNotifications': true,
      });

      expect(config.fcmTokens, isEmpty);
    });
  });
}
