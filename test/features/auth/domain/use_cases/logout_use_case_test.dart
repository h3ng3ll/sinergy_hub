import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sinergy_hub/features/auth/domain/repostories/i_auth_repository.dart';
import 'package:sinergy_hub/features/auth/domain/use_cases/logout_use_case.dart';

class _AuthRepositoryMock extends Mock implements IAuthRepository {}

void main() {
  late _AuthRepositoryMock authRepository;
  late LogoutUseCase useCase;

  setUp(() {
    authRepository = _AuthRepositoryMock();
    useCase = LogoutUseCase(authRepository: authRepository);
  });

  group('LogoutUseCase', () {
    test('calls authRepository.signOut', () async {
      when(() => authRepository.signOut()).thenAnswer((_) async {});

      await useCase();

      verify(() => authRepository.signOut()).called(1);
      verifyNoMoreInteractions(authRepository);
    });

    test('signOut failure propagates', () async {
      when(() => authRepository.signOut()).thenThrow(Exception('signout-fail'));

      await expectLater(useCase(), throwsA(isA<Exception>()));
      verify(() => authRepository.signOut()).called(1);
    });

    test('multiple invocations call signOut each time', () async {
      when(() => authRepository.signOut()).thenAnswer((_) async {});

      await useCase();
      await useCase();

      verify(() => authRepository.signOut()).called(2);
    });
  });
}
