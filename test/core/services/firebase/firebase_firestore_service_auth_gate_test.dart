import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sinergy_hub/core/services/firebase/firebase_firestore_service.dart';
import 'package:sinergy_hub/core/services/logger_service.dart';

class _MockFirebaseAuth extends Mock implements FirebaseAuth {}

class _MockUser extends Mock implements User {}

class _MockLoggerService extends Mock implements LoggerService {}

void main() {
  late _MockFirebaseAuth auth;
  late _MockLoggerService logger;
  late FirebaseFirestoreService service;

  // Drives FirebaseAuth.userChanges(); the other two change streams are kept
  // empty so authState is fed solely by this controller.
  late StreamController<User?> authController;

  User userWithUid(String uid) {
    final user = _MockUser();
    when(() => user.uid).thenReturn(uid);
    return user;
  }

  setUp(() {
    auth = _MockFirebaseAuth();
    logger = _MockLoggerService();
    authController = StreamController<User?>.broadcast();

    when(() => auth.userChanges()).thenAnswer((_) => authController.stream);
    when(() => auth.authStateChanges())
        .thenAnswer((_) => const Stream<User?>.empty());
    when(() => auth.idTokenChanges())
        .thenAnswer((_) => const Stream<User?>.empty());

    service = FirebaseFirestoreService(
      firebaseFirestore: _UnusedFirestore(),
      firebaseAuth: auth,
      logger: logger,
    );
  });

  tearDown(() async {
    await authController.close();
  });

  group('FirebaseFirestoreService.authGated', () {
    test('forwards inner values and calls build with the current uid while authed',
        () async {
      final seenUids = <String>[];

      final gated = service.authGated<int>((uid) {
        seenUids.add(uid);
        return Stream<int>.fromIterable([1, 2, 3]);
      });

      final received = <int>[];
      final sub = gated.listen(received.add);

      authController.add(userWithUid('me'));
      await pumpEventQueue();

      expect(seenUids, ['me']);
      expect(received, [1, 2, 3]);

      await sub.cancel();
    });

    test('swaps to empty and cancels the inner subscription on logout',
        () async {
      var innerCancelled = false;
      late StreamController<int> inner;
      inner = StreamController<int>(
        onCancel: () => innerCancelled = true,
      );

      final gated = service.authGated<int>((_) => inner.stream);

      final received = <int>[];
      final sub = gated.listen(received.add);

      authController.add(userWithUid('me'));
      await pumpEventQueue();
      inner.add(10);
      await pumpEventQueue();
      expect(received, [10]);
      expect(innerCancelled, isFalse);

      // User signs out -> switchMap should drop the inner stream.
      authController.add(null);
      await pumpEventQueue();
      expect(innerCancelled, isTrue);

      // Late emissions after logout are not forwarded.
      if (!inner.isClosed) {
        inner.add(20);
      }
      await pumpEventQueue();
      expect(received, [10]);

      await sub.cancel();
      if (!inner.isClosed) await inner.close();
    });

    test('suppresses permission-denied as a warning and keeps the stream alive',
        () async {
      final gated = service.authGated<int>(
        (_) => Stream<int>.error(
          FirebaseException(
            plugin: 'cloud_firestore',
            code: 'permission-denied',
            message: 'The caller does not have permission',
          ),
        ),
      );

      Object? forwardedError;
      final sub = gated.listen(
        (_) {},
        onError: (Object e) => forwardedError = e,
      );

      authController.add(userWithUid('me'));
      await pumpEventQueue();

      // Error was swallowed (not forwarded) and logged as a warning.
      expect(forwardedError, isNull);
      verify(
        () => logger.warning(
          any(),
          error: any(named: 'error'),
          name: any(named: 'name'),
        ),
      ).called(1);

      await sub.cancel();
    });

    test('propagates non permission-denied errors to the listener', () async {
      final failure = FirebaseException(
        plugin: 'cloud_firestore',
        code: 'unavailable',
        message: 'backend unavailable',
      );

      final gated = service.authGated<int>(
        (_) => Stream<int>.error(failure),
      );

      Object? forwardedError;
      final sub = gated.listen(
        (_) {},
        onError: (Object e) => forwardedError = e,
      );

      authController.add(userWithUid('me'));
      await pumpEventQueue();

      expect(forwardedError, same(failure));
      verifyNever(
        () => logger.warning(
          any(),
          error: any(named: 'error'),
          name: any(named: 'name'),
        ),
      );

      await sub.cancel();
    });

    test(
      'suppresses permission-denied that races sign-out (error then null)',
      () async {
        // Regression for the device bug (0 warnings logged, ChatsFilterBloc
        // went to `failed`): the Firestore listener emits permission-denied in
        // the SAME turn that auth is about to emit null. The error is queued on
        // the inner stream and auth-null is queued right after it. The gate must
        // swallow the error (inner OR outer guard) and never forward it.
        final inner = StreamController<int>();

        final gated = service.authGated<int>((_) => inner.stream);

        Object? forwardedError;
        final sub = gated.listen(
          (_) {},
          onError: (Object e) => forwardedError = e,
        );

        authController.add(userWithUid('me'));
        await pumpEventQueue();

        // Same-turn race: error and sign-out enqueued together.
        inner.addError(
          FirebaseException(
            plugin: 'cloud_firestore',
            code: 'permission-denied',
            message: 'The caller does not have permission',
          ),
        );
        authController.add(null);
        await pumpEventQueue();

        expect(forwardedError, isNull);
        verify(
          () => logger.warning(
            any(),
            error: any(named: 'error'),
            name: any(named: 'name'),
          ),
        ).called(greaterThanOrEqualTo(1));

        await sub.cancel();
        if (!inner.isClosed) await inner.close();
      },
    );

    test(
      'outer guard swallows permission-denied surfacing post-switch',
      () async {
        // A build() whose stream is itself a switchMap result can surface an
        // error on the outer stream after the inner swap. Model that directly:
        // the build returns a stream that errors, and we assert the OUTER
        // handleError catches it even when the inner stream is a passthrough.
        final gated = service.authGated<int>(
          (_) => Stream<int>.error(
            FirebaseException(
              plugin: 'cloud_firestore',
              code: 'permission-denied',
              message: 'denied',
            ),
          ).asBroadcastStream(),
        );

        Object? forwardedError;
        final sub = gated.listen(
          (_) {},
          onError: (Object e) => forwardedError = e,
        );

        authController.add(userWithUid('me'));
        await pumpEventQueue();

        expect(forwardedError, isNull);
        verify(
          () => logger.warning(
            any(),
            error: any(named: 'error'),
            name: any(named: 'name'),
          ),
        ).called(greaterThanOrEqualTo(1));

        await sub.cancel();
      },
    );
  });
}

/// FirebaseFirestore is required by the constructor but never touched by the
/// auth-gate code path, so a bare mock is sufficient.
class _UnusedFirestore extends Mock implements FirebaseFirestore {}
