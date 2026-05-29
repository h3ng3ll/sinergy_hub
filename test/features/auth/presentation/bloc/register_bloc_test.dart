import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sinergy_hub/features/auth/domain/failures/auth_failures.dart';
import 'package:sinergy_hub/features/auth/domain/failures/auth_unreachable_failure.dart';
import 'package:sinergy_hub/features/auth/domain/failures/email_not_verified_failure.dart';
import 'package:sinergy_hub/features/auth/domain/failures/user_exists_with_such_email_failure.dart';
import 'package:sinergy_hub/features/auth/domain/use_cases/complete_registration_use_case.dart';
import 'package:sinergy_hub/features/auth/domain/use_cases/register_use_case.dart';
import 'package:sinergy_hub/features/auth/presentation/pages/register_page/bloc/register_bloc/register_bloc.dart';

class _RegisterUseCaseMock extends Mock implements RegisterUseCase {}

class _CompleteRegistrationUseCaseMock extends Mock
    implements CompleteRegistrationUseCase {}

void main() {
  late _RegisterUseCaseMock registerUseCase;
  late _CompleteRegistrationUseCaseMock completeRegistrationUseCase;

  const email = 'a@b.com';
  const password = 'secret123';

  RegisterBloc build() => RegisterBloc(
    registerUseCase: registerUseCase,
    completeRegistrationUseCase: completeRegistrationUseCase,
  );

  setUp(() {
    registerUseCase = _RegisterUseCaseMock();
    completeRegistrationUseCase = _CompleteRegistrationUseCaseMock();
  });

  group('RegisterBloc — Register event', () {
    blocTest<RegisterBloc, RegisterState>(
      'happy path → loading → pendingVerification; no finalize called',
      build: () {
        when(
          () => registerUseCase.call(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenAnswer((_) async => Left(null));
        return build();
      },
      act: (bloc) => bloc.add(
        const RegisterEvent.register(email: email, password: password),
      ),
      expect: () => const [
        RegisterState(status: RegisterStatus.loading),
        RegisterState(
          status: RegisterStatus.pendingVerification,
          resendCountdown: 60,
        ),
      ],
      verify: (_) {
        verify(
          () => registerUseCase.call(email: email, password: password),
        ).called(1);
        verifyNever(() => completeRegistrationUseCase.call());
      },
    );

    blocTest<RegisterBloc, RegisterState>(
      'failure → loading → failed; no finalize called',
      build: () {
        final AuthFailure failure = UserExistsWithSuchEmailFailure();
        when(
          () => registerUseCase.call(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenAnswer((_) async => Right(failure));
        return build();
      },
      act: (bloc) => bloc.add(
        const RegisterEvent.register(email: email, password: password),
      ),
      expect: () => [
        const RegisterState(status: RegisterStatus.loading),
        RegisterState(
          status: RegisterStatus.failed,
          errorMessage: UserExistsWithSuchEmailFailure().message,
        ),
      ],
      verify: (_) {
        verifyNever(() => completeRegistrationUseCase.call());
      },
    );
  });

  group('RegisterBloc — CheckVerification event', () {
    blocTest<RegisterBloc, RegisterState>(
      'verified → emits registered',
      build: () {
        when(() => completeRegistrationUseCase.call()).thenAnswer(
          (_) async => Left(null),
        );
        return build();
      },
      seed: () => const RegisterState(
        status: RegisterStatus.pendingVerification,
      ),
      act: (bloc) => bloc.add(const RegisterEvent.checkVerification()),
      expect: () => const [
        RegisterState(status: RegisterStatus.registered),
      ],
      verify: (_) {
        verify(() => completeRegistrationUseCase.call()).called(1);
      },
    );

    blocTest<RegisterBloc, RegisterState>(
      'still not verified → stays in pendingVerification (no emit)',
      build: () {
        when(() => completeRegistrationUseCase.call()).thenAnswer(
          (_) async => Right(const EmailNotVerifiedFailure()),
        );
        return build();
      },
      seed: () => const RegisterState(
        status: RegisterStatus.pendingVerification,
      ),
      act: (bloc) => bloc.add(const RegisterEvent.checkVerification()),
      expect: () => const <RegisterState>[],
    );

    blocTest<RegisterBloc, RegisterState>(
      'real failure during polling → emits failed with message',
      build: () {
        when(() => completeRegistrationUseCase.call()).thenAnswer(
          (_) async => Right(AuthUnreachableFailure()),
        );
        return build();
      },
      seed: () => const RegisterState(
        status: RegisterStatus.pendingVerification,
      ),
      act: (bloc) => bloc.add(const RegisterEvent.checkVerification()),
      expect: () => [
        RegisterState(
          status: RegisterStatus.failed,
          errorMessage: AuthUnreachableFailure().message,
        ),
      ],
    );
  });

  group('RegisterBloc — full flow', () {
    blocTest<RegisterBloc, RegisterState>(
      'register then checkVerification calls use cases in order',
      build: () {
        when(
          () => registerUseCase.call(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenAnswer((_) async => Left(null));
        when(() => completeRegistrationUseCase.call()).thenAnswer(
          (_) async => Left(null),
        );
        return build();
      },
      act: (bloc) async {
        bloc.add(
          const RegisterEvent.register(email: email, password: password),
        );
        await Future<void>.delayed(Duration.zero);
        bloc.add(const RegisterEvent.checkVerification());
      },
      expect: () => const [
        RegisterState(status: RegisterStatus.loading),
        RegisterState(
          status: RegisterStatus.pendingVerification,
          resendCountdown: 60,
        ),
        RegisterState(
          status: RegisterStatus.registered,
          resendCountdown: 60,
        ),
      ],
      verify: (_) {
        verifyInOrder([
          () => registerUseCase.call(email: email, password: password),
          () => completeRegistrationUseCase.call(),
        ]);
      },
    );

    blocTest<RegisterBloc, RegisterState>(
      'droppable transformer drops overlapping CheckVerification ticks',
      build: () {
        when(() => completeRegistrationUseCase.call()).thenAnswer((_) async {
          await Future<void>.delayed(const Duration(milliseconds: 50));
          return Right(const EmailNotVerifiedFailure());
        });
        return build();
      },
      seed: () => const RegisterState(
        status: RegisterStatus.pendingVerification,
      ),
      act: (bloc) {
        bloc.add(const RegisterEvent.checkVerification());
        bloc.add(const RegisterEvent.checkVerification());
        bloc.add(const RegisterEvent.checkVerification());
      },
      wait: const Duration(milliseconds: 200),
      verify: (_) {
        verify(() => completeRegistrationUseCase.call()).called(1);
      },
    );
  });
}
