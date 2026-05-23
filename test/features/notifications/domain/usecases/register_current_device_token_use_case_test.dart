import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sinergy_hub/core/services/firebase/firebase_messaging_service.dart';
import 'package:sinergy_hub/features/notifications/domain/failures/register_device_token_failure.dart';
import 'package:sinergy_hub/features/notifications/domain/models/notification_config/notification_config.dart';
import 'package:sinergy_hub/features/notifications/domain/usecases/register_current_device_token_use_case.dart';

import '../../data/repositories/notification_config_repository_mock.dart';
import '../../../auth/data/repositories/auth_repository_mock.dart';

class _FirebaseMessagingServiceMock extends Mock
    implements FirebaseMessagingService {}

void main() {
  late NotificationConfigRepositoryMock repo;
  late AuthRepositoryMock authRepo;
  late _FirebaseMessagingServiceMock messaging;
  late RegisterCurrentDeviceTokenUseCase useCase;

  const uid = 'uid-1';

  setUp(() {
    repo = NotificationConfigRepositoryMock();
    authRepo = AuthRepositoryMock();
    messaging = _FirebaseMessagingServiceMock();
    useCase = RegisterCurrentDeviceTokenUseCase(
      notificationConfigRepository: repo,
      authRepository: authRepo,
      firebaseMessagingService: messaging,
    );
  });

  test('web (platformKey == null) → Left(config unchanged), no writes', () async {
    when(() => messaging.platformKey).thenReturn(null);

    const input = NotificationConfig(fcmTokens: {'android': 'tok-a'});
    final res = await useCase.call(config: input);

    expect(res.isLeft(), isTrue);
    res.fold(
      (c) => expect(c, same(input)),
      (_) => fail('expected Left'),
    );
    verifyNever(() => authRepo.requireUserId());
    verifyNever(
      () => repo.upsertToken(
        uid: any(named: 'uid'),
        platform: any(named: 'platform'),
        token: any(named: 'token'),
      ),
    );
  });

  test('token already matches for this platform → Left(config unchanged), no writes', () async {
    when(() => messaging.platformKey).thenReturn('android');
    when(() => messaging.fcmToken).thenReturn('tok-a');

    const input = NotificationConfig(fcmTokens: {'android': 'tok-a'});
    final res = await useCase.call(config: input);

    expect(res.isLeft(), isTrue);
    res.fold(
      (c) => expect(c, same(input)),
      (_) => fail('expected Left'),
    );
    verifyNever(() => authRepo.requireUserId());
    verifyNever(
      () => repo.upsertToken(
        uid: any(named: 'uid'),
        platform: any(named: 'platform'),
        token: any(named: 'token'),
      ),
    );
  });

  test('new token on android → Left(merged map), persists', () async {
    when(() => messaging.platformKey).thenReturn('android');
    when(() => messaging.fcmToken).thenReturn('tok-a-new');
    when(() => authRepo.requireUserId()).thenAnswer((_) async => uid);
    when(
      () => repo.upsertToken(
        uid: any(named: 'uid'),
        platform: any(named: 'platform'),
        token: any(named: 'token'),
      ),
    ).thenAnswer((_) async {});

    final res = await useCase.call(
      config: const NotificationConfig(fcmTokens: {'ios': 'tok-i'}),
    );

    expect(res.isLeft(), isTrue);
    res.fold(
      (c) => expect(c.fcmTokens, {'ios': 'tok-i', 'android': 'tok-a-new'}),
      (_) => fail('expected Left'),
    );
    verifyInOrder([
      () => authRepo.requireUserId(),
      () => repo.upsertToken(uid: uid, platform: 'android', token: 'tok-a-new'),
    ]);
  });

  test('repository throws → Right(RegisterDeviceTokenFailure)', () async {
    when(() => messaging.platformKey).thenReturn('ios');
    when(() => messaging.fcmToken).thenReturn('tok-i');
    when(() => authRepo.requireUserId()).thenAnswer((_) async => uid);
    when(
      () => repo.upsertToken(
        uid: any(named: 'uid'),
        platform: any(named: 'platform'),
        token: any(named: 'token'),
      ),
    ).thenThrow(Exception('boom'));

    final res = await useCase.call(config: const NotificationConfig());

    expect(res.isRight(), isTrue);
    res.fold(
      (_) => fail('expected Right'),
      (f) => expect(f, isA<RegisterDeviceTokenFailure>()),
    );
  });
}
