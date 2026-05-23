import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sinergy_hub/features/notifications/domain/failures/load_notification_config_failure.dart';
import 'package:sinergy_hub/features/notifications/domain/failures/register_device_token_failure.dart';
import 'package:sinergy_hub/features/notifications/domain/failures/save_notification_config_failure.dart';
import 'package:sinergy_hub/features/notifications/domain/models/notification_config/notification_config.dart';
import 'package:sinergy_hub/features/notifications/domain/usecases/get_notification_config_use_case.dart';
import 'package:sinergy_hub/features/notifications/domain/usecases/register_current_device_token_use_case.dart';
import 'package:sinergy_hub/features/notifications/domain/usecases/save_notification_config_use_case.dart';
import 'package:sinergy_hub/features/notifications/presentation/bloc/notification_config_bloc/notification_config_bloc.dart';

class _GetUseCaseMock extends Mock implements GetNotificationsConfigUseCase {}

class _SaveUseCaseMock extends Mock implements SaveNotificationsConfigUseCase {}

class _RegisterTokenUseCaseMock extends Mock
    implements RegisterCurrentDeviceTokenUseCase {}

void main() {
  late _GetUseCaseMock getUseCase;
  late _SaveUseCaseMock saveUseCase;
  late _RegisterTokenUseCaseMock registerTokenUseCase;

  setUpAll(() {
    registerFallbackValue(const NotificationConfig());
  });

  setUp(() {
    getUseCase = _GetUseCaseMock();
    saveUseCase = _SaveUseCaseMock();
    registerTokenUseCase = _RegisterTokenUseCaseMock();
  });

  NotificationConfigBloc buildBloc() => NotificationConfigBloc(
        getNotificationsConfigUseCase: getUseCase,
        saveNotificationsConfigUseCase: saveUseCase,
        registerCurrentDeviceTokenUseCase: registerTokenUseCase,
      );

  group('NotificationConfigBloc.init', () {
    blocTest<NotificationConfigBloc, NotificationConfigState>(
      'load Left + register Left → emits final config with initial status',
      build: () {
        when(() => getUseCase.call()).thenAnswer(
          (_) async => const Left(NotificationConfig()),
        );
        when(
          () => registerTokenUseCase.call(config: any(named: 'config')),
        ).thenAnswer(
          (_) async => const Left(
            NotificationConfig(fcmTokens: {'android': 'tok-a'}),
          ),
        );
        return buildBloc();
      },
      act: (b) => b.add(const NotificationConfigEvent.init()),
      expect: () => [
        const NotificationConfigState(
          status: NotificationConfigStatus.loading,
        ),
        const NotificationConfigState(
          config: NotificationConfig(fcmTokens: {'android': 'tok-a'}),
        ),
      ],
      verify: (_) {
        verify(
          () => registerTokenUseCase.call(
            config: const NotificationConfig(),
          ),
        ).called(1);
      },
    );

    blocTest<NotificationConfigBloc, NotificationConfigState>(
      'load Right → emits failed, does NOT call register',
      build: () {
        when(() => getUseCase.call()).thenAnswer(
          (_) async => Right(LoadNotificationConfigFailure()),
        );
        return buildBloc();
      },
      act: (b) => b.add(const NotificationConfigEvent.init()),
      expect: () => [
        const NotificationConfigState(
          status: NotificationConfigStatus.loading,
        ),
        NotificationConfigState(
          status: NotificationConfigStatus.failed,
          errorMessage: LoadNotificationConfigFailure().message,
        ),
      ],
      verify: (_) {
        verifyNever(
          () => registerTokenUseCase.call(config: any(named: 'config')),
        );
      },
    );

    blocTest<NotificationConfigBloc, NotificationConfigState>(
      'register Right → emits failed, keeps loaded config',
      build: () {
        when(() => getUseCase.call()).thenAnswer(
          (_) async => const Left(
            NotificationConfig(enabledNotifications: false),
          ),
        );
        when(
          () => registerTokenUseCase.call(config: any(named: 'config')),
        ).thenAnswer(
          (_) async => Right(RegisterDeviceTokenFailure()),
        );
        return buildBloc();
      },
      act: (b) => b.add(const NotificationConfigEvent.init()),
      expect: () => [
        const NotificationConfigState(
          status: NotificationConfigStatus.loading,
        ),
        NotificationConfigState(
          config: const NotificationConfig(enabledNotifications: false),
          status: NotificationConfigStatus.failed,
          errorMessage: RegisterDeviceTokenFailure().message,
        ),
      ],
    );

    blocTest<NotificationConfigBloc, NotificationConfigState>(
      'load Left(null) → register receives state.config seed',
      build: () {
        when(() => getUseCase.call()).thenAnswer(
          (_) async => const Left(null),
        );
        when(
          () => registerTokenUseCase.call(config: any(named: 'config')),
        ).thenAnswer((_) async => const Left(NotificationConfig()));
        return buildBloc();
      },
      act: (b) => b.add(const NotificationConfigEvent.init()),
      verify: (_) {
        verify(
          () => registerTokenUseCase.call(
            config: const NotificationConfig(),
          ),
        ).called(1);
      },
    );
  });

  group('NotificationConfigBloc.save', () {
    blocTest<NotificationConfigBloc, NotificationConfigState>(
      'save Left → emits new config with initial status',
      build: () {
        when(
          () => saveUseCase.call(config: any(named: 'config')),
        ).thenAnswer((_) async => const Left(null));
        return buildBloc();
      },
      seed: () => const NotificationConfigState(
        config: NotificationConfig(
          enabledNotifications: true,
          fcmTokens: {'android': 'tok-a'},
        ),
      ),
      act: (b) =>
          b.add(const NotificationConfigEvent.save(isEnabledNotifications: false)),
      expect: () => [
        const NotificationConfigState(
          status: NotificationConfigStatus.loading,
          config: NotificationConfig(
            enabledNotifications: true,
            fcmTokens: {'android': 'tok-a'},
          ),
        ),
        const NotificationConfigState(
          config: NotificationConfig(
            enabledNotifications: false,
            fcmTokens: {'android': 'tok-a'},
          ),
        ),
      ],
      verify: (_) {
        verify(
          () => saveUseCase.call(
            config: const NotificationConfig(
              enabledNotifications: false,
              fcmTokens: {'android': 'tok-a'},
            ),
          ),
        ).called(1);
      },
    );

    blocTest<NotificationConfigBloc, NotificationConfigState>(
      'save Right → emits failed status with failure message, leaves config unchanged',
      build: () {
        when(
          () => saveUseCase.call(config: any(named: 'config')),
        ).thenAnswer((_) async => Right(SaveNotificationConfigFailure()));
        return buildBloc();
      },
      seed: () => const NotificationConfigState(
        config: NotificationConfig(enabledNotifications: true),
      ),
      act: (b) =>
          b.add(const NotificationConfigEvent.save(isEnabledNotifications: false)),
      expect: () => [
        const NotificationConfigState(
          status: NotificationConfigStatus.loading,
          config: NotificationConfig(enabledNotifications: true),
        ),
        NotificationConfigState(
          config: const NotificationConfig(enabledNotifications: true),
          status: NotificationConfigStatus.failed,
          errorMessage: SaveNotificationConfigFailure().message,
        ),
      ],
    );

    blocTest<NotificationConfigBloc, NotificationConfigState>(
      'no-op when config does not change',
      build: () => buildBloc(),
      seed: () => const NotificationConfigState(
        config: NotificationConfig(enabledNotifications: true),
      ),
      act: (b) =>
          b.add(const NotificationConfigEvent.save(isEnabledNotifications: true)),
      expect: () => <NotificationConfigState>[],
      verify: (_) {
        verifyNever(() => saveUseCase.call(config: any(named: 'config')));
      },
    );
  });
}
