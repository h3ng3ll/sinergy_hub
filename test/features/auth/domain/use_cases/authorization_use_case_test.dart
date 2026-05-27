import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sinergy_hub/features/auth/domain/use_cases/authorization_use_case.dart';
import 'package:sinergy_hub/features/chat/domain/services/i_presence_service.dart';

class _PresenceServiceMock extends Mock implements IPresenceService {}

void main() {
  late _PresenceServiceMock presence;
  late AuthorizationUseCase useCase;

  setUp(() {
    presence = _PresenceServiceMock();
    useCase = AuthorizationUseCase(presenceService: presence);
  });

  group('AuthorizationUseCase', () {
    test('initialises presence service', () async {
      when(() => presence.init()).thenAnswer((_) async {});

      await useCase();

      verify(() => presence.init()).called(1);
      verifyNoMoreInteractions(presence);
    });

    test('presence.init failure propagates', () async {
      when(() => presence.init()).thenThrow(Exception('presence-fail'));

      await expectLater(useCase(), throwsA(isA<Exception>()));
      verify(() => presence.init()).called(1);
    });

    test('multiple invocations call presence.init each time', () async {
      when(() => presence.init()).thenAnswer((_) async {});

      await useCase();
      await useCase();

      verify(() => presence.init()).called(2);
    });
  });
}
