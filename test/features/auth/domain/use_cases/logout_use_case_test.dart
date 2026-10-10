import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sinergy_hub/core/services/firebase/firebase_functions_service.dart';
import 'package:sinergy_hub/core/services/firebase/firebase_messaging_service.dart';
import 'package:sinergy_hub/features/auth/domain/repostories/i_auth_repository.dart';
import 'package:sinergy_hub/features/auth/domain/use_cases/logout_use_case.dart';

class _AuthRepositoryMock extends Mock implements IAuthRepository {}

class _FunctionsServiceMock extends Mock implements FirebaseFunctionsService {}

class _MessagingServiceMock extends Mock implements FirebaseMessagingService {}

void main() {
  setUpAll(() => registerFallbackValue(Duration.zero));

  late _AuthRepositoryMock authRepository;
  late _FunctionsServiceMock functions;
  late _MessagingServiceMock messaging;
  late LogoutUseCase useCase;

  void stubOnLogout() => when(
        () => functions.call(
          functionName: any(named: 'functionName'),
          data: any(named: 'data'),
          timeout: any(named: 'timeout'),
        ),
      ).thenAnswer((_) async => null);

  setUp(() {
    authRepository = _AuthRepositoryMock();
    functions = _FunctionsServiceMock();
    messaging = _MessagingServiceMock();
    when(() => messaging.platformKey).thenReturn('android');
    when(() => messaging.fcmTokenReady).thenAnswer((_) async => 'T');
    when(() => authRepository.signOut()).thenAnswer((_) async {});
    useCase = LogoutUseCase(
      authRepository: authRepository,
      firebaseFunctionsService: functions,
      firebaseMessagingService: messaging,
    );
  });

  group('LogoutUseCase', () {
    test('makes ONE onLogout call with this device token, BEFORE signOut',
        () async {
      // Regression guard: the callable needs the still-authenticated user;
      // if signOut() runs first it is rejected as unauthenticated and the
      // user stays online with the token attached to the account.
      stubOnLogout();

      await useCase();

      verifyInOrder([
        () => functions.call(
              functionName: 'onLogout',
              data: {'platform': 'android', 'token': 'T'},
              timeout: any(named: 'timeout'),
            ),
        () => authRepository.signOut(),
      ]);
      verifyNoMoreInteractions(functions);
    });

    test('sends no device fields when there is no token', () async {
      when(() => messaging.fcmTokenReady).thenAnswer((_) async => null);
      stubOnLogout();

      await useCase();

      verify(
        () => functions.call(
          functionName: 'onLogout',
          data: <String, dynamic>{},
          timeout: any(named: 'timeout'),
        ),
      ).called(1);
    });

    test('a failing onLogout never blocks signOut', () async {
      when(
        () => functions.call(
          functionName: any(named: 'functionName'),
          data: any(named: 'data'),
          timeout: any(named: 'timeout'),
        ),
      ).thenThrow(Exception('offline'));

      await useCase();

      verify(() => authRepository.signOut()).called(1);
    });

    test('signOut failure propagates', () async {
      stubOnLogout();
      when(() => authRepository.signOut()).thenThrow(Exception('signout-fail'));

      await expectLater(useCase(), throwsA(isA<Exception>()));
    });
  });
}
