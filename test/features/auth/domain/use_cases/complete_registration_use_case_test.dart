import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sinergy_hub/features/auth/domain/failures/auth_failures.dart';
import 'package:sinergy_hub/features/auth/domain/failures/auth_unreachable_failure.dart';
import 'package:sinergy_hub/features/auth/domain/failures/email_not_verified_failure.dart';
import 'package:sinergy_hub/features/auth/domain/repostories/i_auth_repository.dart';
import 'package:sinergy_hub/features/auth/domain/use_cases/authorization_use_case.dart';
import 'package:sinergy_hub/features/auth/domain/use_cases/complete_registration_use_case.dart';

class _AuthRepositoryMock extends Mock implements IAuthRepository {}

class _AuthorizationUseCaseMock extends Mock implements AuthorizationUseCase {}

class _UserMock extends Mock implements User {}

void main() {
  late _AuthRepositoryMock authRepository;
  late _AuthorizationUseCaseMock authorizationUseCase;
  late CompleteRegistrationUseCase useCase;

  setUp(() {
    authRepository = _AuthRepositoryMock();
    authorizationUseCase = _AuthorizationUseCaseMock();
    when(() => authRepository.getCurrentUser()).thenAnswer(
      (_) async => _UserMock(),
    );
    useCase = CompleteRegistrationUseCase(
      authRepository: authRepository,
      authorizationUseCase: authorizationUseCase,
    );
  });

  group('CompleteRegistrationUseCase', () {
    test(
      'reload failure → returns Right(failure), does not check verification or authorize',
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
        verifyNever(() => authorizationUseCase());
      },
    );

    test(
      'reload OK + not verified → returns EmailNotVerifiedFailure, does not authorize',
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
        verifyNever(() => authorizationUseCase());
      },
    );

    test(
      'reload OK + verified → authorizes in order, returns Left(null)',
      () async {
        when(() => authRepository.reload()).thenAnswer((_) async => Left(null));
        when(() => authRepository.isEmailVerified()).thenAnswer(
          (_) async => true,
        );
        when(() => authorizationUseCase()).thenAnswer((_) async {});

        final res = await useCase.call();

        expect(res.isLeft(), isTrue);
        verifyInOrder([
          () => authRepository.reload(),
          () => authRepository.isEmailVerified(),
          () => authorizationUseCase(),
        ]);
      },
    );
  });
}
