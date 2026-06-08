import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sinergy_hub/core/services/firebase/firebase_auth_service.dart';
import 'package:sinergy_hub/core/services/firebase/firebase_realtime_db_service.dart';
import 'package:sinergy_hub/features/chat/data/services/presence_service.dart';

class _FirebaseRealtimeDbServiceMock extends Mock
    implements FirebaseRealtimeDbService {}

class _FirebaseAuthServiceMock extends Mock implements FirebaseAuthService {}

class _FirebaseDatabaseMock extends Mock implements FirebaseDatabase {}

class _DatabaseReferenceMock extends Mock implements DatabaseReference {}

class _UserMock extends Mock implements User {}

void main() {
  late _FirebaseRealtimeDbServiceMock realtimeDbService;
  late _FirebaseAuthServiceMock authService;
  late _FirebaseDatabaseMock database;
  late _DatabaseReferenceMock statusRef;
  late PresenceService service;

  const uid = 'user-123';

  setUpAll(() {
    registerFallbackValue(<String, dynamic>{});
  });

  setUp(() {
    realtimeDbService = _FirebaseRealtimeDbServiceMock();
    authService = _FirebaseAuthServiceMock();
    database = _FirebaseDatabaseMock();
    statusRef = _DatabaseReferenceMock();

    when(() => realtimeDbService.database).thenReturn(database);
    when(() => database.ref(any())).thenReturn(statusRef);
    when(() => statusRef.set(any())).thenAnswer((_) async {});

    service = PresenceService(
      firebaseRealtimeDbService: realtimeDbService,
      firebaseAuthService: authService,
    );
  });

  group('PresenceService.setOffline', () {
    test('writes offline state at status/<uid> when a user is signed in',
        () async {
      final user = _UserMock();
      when(() => user.uid).thenReturn(uid);
      when(() => authService.currentUser).thenReturn(user);

      await service.setOffline();

      verify(() => database.ref('status/$uid')).called(1);
      final captured =
          verify(() => statusRef.set(captureAny())).captured.single
              as Map<dynamic, dynamic>;
      expect(captured['state'], 'offline');
      expect(captured['last_seen'], ServerValue.timestamp);
    });

    test('does nothing when there is no current user', () async {
      when(() => authService.currentUser).thenReturn(null);

      await service.setOffline();

      verifyNever(() => database.ref(any()));
      verifyNever(() => statusRef.set(any()));
    });
  });
}
