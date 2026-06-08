import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sinergy_hub/features/auth/domain/repostories/i_auth_repository.dart';
import 'package:sinergy_hub/features/auth/domain/use_cases/logout_use_case.dart';
import 'package:sinergy_hub/features/chat/domain/services/i_presence_service.dart';

class _AuthRepositoryMock extends Mock implements IAuthRepository {}

class _PresenceServiceMock extends Mock implements IPresenceService {}

void main() {
  late _AuthRepositoryMock authRepository;
  late _PresenceServiceMock presenceService;
  late LogoutUseCase useCase;

  setUp(() {
    authRepository = _AuthRepositoryMock();
    presenceService = _PresenceServiceMock();
    useCase = LogoutUseCase(
      authRepository: authRepository,
      presenceService: presenceService,
    );
  });

  group('LogoutUseCase', () {
    test('sets offline BEFORE signing out', () async {
      // Regression guard: if signOut() runs first, FirebaseAuth.currentUser
      // becomes null and the offline write can never resolve the uid — the
      // exact bug that left logged-out users showing as "online".
      when(() => presenceService.setOffline()).thenAnswer((_) async {});
      when(() => authRepository.signOut()).thenAnswer((_) async {});

      await useCase();

      verifyInOrder([
        () => presenceService.setOffline(),
        () => authRepository.signOut(),
      ]);
    });

    test('calls presence.setOffline then authRepository.signOut once each',
        () async {
      when(() => presenceService.setOffline()).thenAnswer((_) async {});
      when(() => authRepository.signOut()).thenAnswer((_) async {});

      await useCase();

      verify(() => presenceService.setOffline()).called(1);
      verify(() => authRepository.signOut()).called(1);
      verifyNoMoreInteractions(presenceService);
      verifyNoMoreInteractions(authRepository);
    });

    test('signOut failure propagates', () async {
      when(() => presenceService.setOffline()).thenAnswer((_) async {});
      when(() => authRepository.signOut()).thenThrow(Exception('signout-fail'));

      await expectLater(useCase(), throwsA(isA<Exception>()));
      verify(() => presenceService.setOffline()).called(1);
      verify(() => authRepository.signOut()).called(1);
    });

    test('setOffline failure short-circuits and does not sign out', () async {
      when(() => presenceService.setOffline())
          .thenThrow(Exception('offline-fail'));

      await expectLater(useCase(), throwsA(isA<Exception>()));
      verify(() => presenceService.setOffline()).called(1);
      verifyNever(() => authRepository.signOut());
    });

    test('multiple invocations call both each time', () async {
      when(() => presenceService.setOffline()).thenAnswer((_) async {});
      when(() => authRepository.signOut()).thenAnswer((_) async {});

      await useCase();
      await useCase();

      verify(() => presenceService.setOffline()).called(2);
      verify(() => authRepository.signOut()).called(2);
    });
  });
}
