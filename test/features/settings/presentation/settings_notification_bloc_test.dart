import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sinergy_hub/features/notifications/domain/failures/notification_config_failures.dart';
import 'package:sinergy_hub/features/notifications/domain/failures/save_notification_config_failure.dart';
import 'package:sinergy_hub/features/notifications/domain/models/notification_config/notification_config.dart';
import 'package:sinergy_hub/features/notifications/domain/usecases/get_notification_config_use_case.dart';
import 'package:sinergy_hub/features/notifications/domain/usecases/save_notification_config_use_case.dart';
import 'package:sinergy_hub/features/settings/presentation/bloc/settings_notification_bloc/settings_notification_bloc.dart';

class _GetNotificationsConfigUseCaseMock extends Mock
    implements GetNotificationsConfigUseCase {}

class _SaveNotificationsConfigUseCaseMock extends Mock
    implements SaveNotificationsConfigUseCase {}

void main() {
  late _GetNotificationsConfigUseCaseMock getConfig;
  late _SaveNotificationsConfigUseCaseMock saveConfig;

  const tokens = <String, String>{'ios': 'token-123'};
  const enabledConfig = NotificationConfig(
    fcmTokens: tokens,
    enabledNotifications: true,
  );
  const disabledConfig = NotificationConfig(
    fcmTokens: tokens,
    enabledNotifications: false,
  );

  SettingsNotificationBloc build() => SettingsNotificationBloc(
    getNotificationsConfigUseCase: getConfig,
    saveNotificationsConfigUseCase: saveConfig,
  );

  setUpAll(() {
    registerFallbackValue(const NotificationConfig());
  });

  setUp(() {
    getConfig = _GetNotificationsConfigUseCaseMock();
    saveConfig = _SaveNotificationsConfigUseCaseMock();
  });

  group('SettingsNotificationBloc.load', () {
    blocTest<SettingsNotificationBloc, SettingsNotificationState>(
      'reflects the stored config → ready with its enabledNotifications',
      build: () {
        when(() => getConfig.call()).thenAnswer(
          (_) async => Left(disabledConfig),
        );
        return build();
      },
      act: (bloc) => bloc.add(const SettingsNotificationEvent.load()),
      expect: () => const [
        SettingsNotificationState(
          status: ESettingsNotificationStatus.loading,
        ),
        SettingsNotificationState(
          status: ESettingsNotificationStatus.ready,
          config: disabledConfig,
          enabledNotifications: false,
        ),
      ],
    );

    blocTest<SettingsNotificationBloc, SettingsNotificationState>(
      'failure → failed with message',
      build: () {
        final NotificationConfigFailure failure =
            SaveNotificationConfigFailure();
        when(() => getConfig.call()).thenAnswer(
          (_) async => Right(failure),
        );
        return build();
      },
      act: (bloc) => bloc.add(const SettingsNotificationEvent.load()),
      expect: () => [
        const SettingsNotificationState(
          status: ESettingsNotificationStatus.loading,
        ),
        SettingsNotificationState(
          status: ESettingsNotificationStatus.failed,
          errorMessage: SaveNotificationConfigFailure().message,
        ),
      ],
    );
  });

  group('SettingsNotificationBloc.toggle', () {
    blocTest<SettingsNotificationBloc, SettingsNotificationState>(
      'success → persists copyWith(enabled), preserves tokens, stays ready',
      build: () {
        when(() => saveConfig.call(config: any(named: 'config'))).thenAnswer(
          (_) async => Left(null),
        );
        return build();
      },
      seed: () => const SettingsNotificationState(
        status: ESettingsNotificationStatus.ready,
        config: enabledConfig,
        enabledNotifications: true,
      ),
      act: (bloc) => bloc.add(
        const SettingsNotificationEvent.toggle(enabled: false),
      ),
      expect: () => const [
        SettingsNotificationState(
          status: ESettingsNotificationStatus.loading,
          config: disabledConfig,
          enabledNotifications: false,
        ),
        SettingsNotificationState(
          status: ESettingsNotificationStatus.ready,
          config: disabledConfig,
          enabledNotifications: false,
        ),
      ],
      verify: (_) {
        final captured = verify(
          () => saveConfig.call(config: captureAny(named: 'config')),
        ).captured.single as NotificationConfig;
        expect(captured.enabledNotifications, isFalse);
        // Tokens preserved via copyWith.
        expect(captured.fcmTokens, tokens);
      },
    );

    blocTest<SettingsNotificationBloc, SettingsNotificationState>(
      'failure → reverts enabledNotifications and emits failed',
      build: () {
        final NotificationConfigFailure failure =
            SaveNotificationConfigFailure();
        when(() => saveConfig.call(config: any(named: 'config'))).thenAnswer(
          (_) async => Right(failure),
        );
        return build();
      },
      seed: () => const SettingsNotificationState(
        status: ESettingsNotificationStatus.ready,
        config: enabledConfig,
        enabledNotifications: true,
      ),
      act: (bloc) => bloc.add(
        const SettingsNotificationEvent.toggle(enabled: false),
      ),
      expect: () => [
        const SettingsNotificationState(
          status: ESettingsNotificationStatus.loading,
          config: disabledConfig,
          enabledNotifications: false,
        ),
        SettingsNotificationState(
          status: ESettingsNotificationStatus.failed,
          config: enabledConfig,
          enabledNotifications: true,
          errorMessage: SaveNotificationConfigFailure().message,
        ),
      ],
    );
  });
}
