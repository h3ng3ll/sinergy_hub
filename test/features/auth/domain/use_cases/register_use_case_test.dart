import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sinergy_hub/features/auth/domain/failures/auth_failures.dart';
import 'package:sinergy_hub/features/auth/domain/failures/user_exists_with_such_email_failure.dart';
import 'package:sinergy_hub/features/auth/domain/repostories/i_auth_repository.dart';
import 'package:sinergy_hub/features/auth/domain/use_cases/register_use_case.dart';

class _AuthRepositoryMock extends Mock implements IAuthRepository {}

void main() {
  late _AuthRepositoryMock authRepository;
  late RegisterUseCase useCase;

  const email = 'a@b.com';
  const password = 'secret123';

  setUp(() {
    authRepository = _AuthRepositoryMock();
    useCase = RegisterUseCase(authRepository: authRepository);
  });

  group('RegisterUseCase', () {
    test(
      'delegates to repository.register and returns its Left(null) on success '
      '(repository owns sending the verification email)',
      () async {
        when(
          () => authRepository.register(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenAnswer((_) async => Left(null));

        final res = await useCase.call(email: email, password: password);

        expect(res.isLeft(), isTrue);
        verify(
          () => authRepository.register(email: email, password: password),
        ).called(1);
      },
    );

    test(
      'propagates the repository failure unchanged',
      () async {
        final AuthFailure failure = UserExistsWithSuchEmailFailure();
        when(
          () => authRepository.register(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenAnswer((_) async => Right(failure));

        final res = await useCase.call(email: email, password: password);

        expect(res.isRight(), isTrue);
        res.fold(
          (_) => fail('expected Right(failure)'),
          (e) => expect(e, same(failure)),
        );
      },
    );
  });
}
