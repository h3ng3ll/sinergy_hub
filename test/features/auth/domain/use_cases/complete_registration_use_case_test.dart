import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sinergy_hub/features/auth/domain/failures/auth_failures.dart';
import 'package:sinergy_hub/features/auth/domain/failures/auth_unreachable_failure.dart';
import 'package:sinergy_hub/features/auth/domain/failures/email_not_verified_failure.dart';
import 'package:sinergy_hub/features/auth/domain/repostories/i_auth_repository.dart';
import 'package:sinergy_hub/features/auth/domain/use_cases/complete_registration_use_case.dart';
import 'package:sinergy_hub/features/chat/domain/services/i_presence_service.dart';

class _AuthRepositoryMock extends Mock implements IAuthRepository {}

class _PresenceServiceMock extends Mock implements IPresenceService {}

void main() {
  late _AuthRepositoryMock authRepository;
  late _PresenceServiceMock presenceService;
  late CompleteRegistrationUseCase useCase;

  setUp(() {
    authRepository = _AuthRepositoryMock();
    presenceService = _PresenceServiceMock();
    useCase = CompleteRegistrationUseCase(
      authRepository: authRepository,
      presenceService: presenceService,
    );
  });

  group('CompleteRegistrationUseCase', () {
    test(
      'reload failure → returns Right(failure), does not check verification or init presence',
      () async {
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
        verifyNever(() => presenceService.init());
      },
    );

    test(
      'reload OK + not verified → returns EmailNotVerifiedFailure, does not init presence',
      () async {
        when(() => authRepository.reload()).thenAnswer((_) async => Left(null));
        when(() => authRepository.isEmailVerified()).thenAnswer(
          (_) async => false,
        );

        final res = await useCase.call();

        expect(res.isRight(), isTrue);
        res.fold(
          (_) => fail('expected Right'),
          (e) => expect(e, isA<EmailNotVerifiedFailure>()),
        );
        verifyNever(() => presenceService.init());
      },
    );

    test(
      'reload OK + verified → inits presence in order, returns Left(null)',
      () async {
        when(() => authRepository.reload()).thenAnswer((_) async => Left(null));
        when(() => authRepository.isEmailVerified()).thenAnswer(
          (_) async => true,
        );
        when(() => presenceService.init()).thenAnswer((_) async {});

        final res = await useCase.call();

        expect(res.isLeft(), isTrue);
        verifyInOrder([
          () => authRepository.reload(),
          () => authRepository.isEmailVerified(),
          () => presenceService.init(),
        ]);
      },
    );
  });
}
