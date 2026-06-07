import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sinergy_hub/core/failures/failure.dart';
import 'package:sinergy_hub/core/failures/uknown_failure.dart';
import 'package:sinergy_hub/features/auth/domain/repostories/i_auth_repository.dart';
import 'package:sinergy_hub/features/user/domain/usecases/delete_account_use_case.dart';

class _AuthRepositoryMock extends Mock implements IAuthRepository {}

void main() {
  late _AuthRepositoryMock authRepository;
  late DeleteAccountUseCase useCase;

  setUp(() {
    authRepository = _AuthRepositoryMock();
    useCase = DeleteAccountUseCase(authRepository: authRepository);
  });

  group('DeleteAccountUseCase', () {
    test('returns Right(null) and calls deleteAccount on success', () async {
      when(() => authRepository.deleteAccount()).thenAnswer((_) async {});

      final result = await useCase();

      expect(result, isA<Right<Failure, void>>());
      verify(() => authRepository.deleteAccount()).called(1);
      verifyNoMoreInteractions(authRepository);
    });

    test('returns Left(UnknownFailure) when deleteAccount throws', () async {
      when(
        () => authRepository.deleteAccount(),
      ).thenThrow(Exception('delete-fail'));

      final result = await useCase();

      expect(result, isA<Left<Failure, void>>());
      result.fold(
        (failure) => expect(failure, isA<UnknownFailure>()),
        (_) => fail('expected a Left'),
      );
      verify(() => authRepository.deleteAccount()).called(1);
    });
  });
}
