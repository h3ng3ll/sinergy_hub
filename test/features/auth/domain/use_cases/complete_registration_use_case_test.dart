import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sinergy_hub/features/auth/domain/failures/auth_failures.dart';
import 'package:sinergy_hub/features/auth/domain/failures/auth_unreachable_failure.dart';
import 'package:sinergy_hub/features/auth/domain/failures/email_not_verified_failure.dart';
import 'package:sinergy_hub/features/auth/domain/repostories/i_auth_repository.dart';
import 'package:sinergy_hub/features/auth/domain/use_cases/complete_registration_use_case.dart';
import 'package:sinergy_hub/features/chat/domain/services/i_presence_service.dart';
import 'package:sinergy_hub/features/user/domain/models/user_data/user_data.dart';
import 'package:sinergy_hub/features/user/domain/repositories/i_user_write_repository.dart';

class _AuthRepositoryMock extends Mock implements IAuthRepository {}

class _UserWriteRepositoryMock extends Mock implements IUserWriteRepository {}

class _PresenceServiceMock extends Mock implements IPresenceService {}

void main() {
  late _AuthRepositoryMock authRepository;
  late _UserWriteRepositoryMock userWriteRepository;
  late _PresenceServiceMock presenceService;
  late CompleteRegistrationUseCase useCase;

  setUpAll(() {
    registerFallbackValue(UserData.none());
  });

  setUp(() {
    authRepository = _AuthRepositoryMock();
    userWriteRepository = _UserWriteRepositoryMock();
    presenceService = _PresenceServiceMock();
    useCase = CompleteRegistrationUseCase(
      authRepository: authRepository,
      // userWriteRepository: userWriteRepository,
      presenceService: presenceService,
    );
  });

  group('CompleteRegistrationUseCase', () {
    test('reload failure → returns Right(failure), no persistence', () async {
      final AuthFailure failure = AuthUnreachableFailure();
      when(() => authRepository.reload()).thenAnswer(
        (_) async => Right(failure),
      );

      final res = await useCase.call();

      expect(res.isRight(), isTrue);
      res.fold(
        (_) => fail('expected Right'),
        (e) => expect(e, same(failure)),
      );
      verifyNever(() => authRepository.isEmailVerified());
      verifyNever(() => authRepository.requireUserId());
      verifyNever(
        () => userWriteRepository.update(userData: any(named: 'userData')),
      );
      verifyNever(() => presenceService.init());
    });

    test(
      'reload OK + not verified → returns EmailNotVerifiedFailure, no persistence',
      () async {
        when(() => authRepository.reload()).thenAnswer(
          (_) async => Left(null),
        );
        when(() => authRepository.isEmailVerified()).thenAnswer(
          (_) async => false,
        );

        final res = await useCase.call();

        expect(res.isRight(), isTrue);
        res.fold(
          (_) => fail('expected Right'),
          (e) => expect(e, isA<EmailNotVerifiedFailure>()),
        );
        verifyNever(() => authRepository.requireUserId());
        verifyNever(
          () => userWriteRepository.update(userData: any(named: 'userData')),
        );
        verifyNever(() => presenceService.init());
      },
    );

    test(
      'reload OK + verified → persists user + inits presence in order',
      () async {
        const uid = 'uid-1';
        when(() => authRepository.reload()).thenAnswer(
          (_) async => Left(null),
        );
        when(() => authRepository.isEmailVerified()).thenAnswer(
          (_) async => true,
        );
        when(() => authRepository.requireUserId()).thenAnswer(
          (_) async => uid,
        );
        when(
          () =>
              userWriteRepository.update(userData: any(named: 'userData')),
        ).thenAnswer((_) async {});
        when(() => presenceService.init()).thenAnswer((_) async {});

        final res = await useCase.call();

        expect(res.isLeft(), isTrue);
        verifyInOrder([
          () => authRepository.reload(),
          () => authRepository.isEmailVerified(),
          () => authRepository.requireUserId(),
          () => userWriteRepository.update(
            userData: any(
              named: 'userData',
              that: isA<UserData>().having((u) => u.uid, 'uid', uid),
            ),
          ),
          () => presenceService.init(),
        ]);
      },
    );
  });
}
