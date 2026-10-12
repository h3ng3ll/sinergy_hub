import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sinergy_hub/core/services/logger_service.dart';
import 'package:talker_flutter/talker_flutter.dart';

class _MockFirebaseCrashlytics extends Mock implements FirebaseCrashlytics {}

void main() {
  late _MockFirebaseCrashlytics crashlytics;
  late LoggerService logger;

  setUpAll(() {
    registerFallbackValue(StackTrace.empty);
  });

  setUp(() {
    crashlytics = _MockFirebaseCrashlytics();
    when(() => crashlytics.log(any())).thenAnswer((_) async {});
    when(
      () => crashlytics.recordError(
        any<dynamic>(),
        any(),
        reason: any<dynamic>(named: 'reason'),
        fatal: any(named: 'fatal'),
      ),
    ).thenAnswer((_) async {});
    logger = LoggerService(crashlytics: crashlytics, talker: Talker());
  });

  group('LoggerService', () {
    test('debug does not throw', () {
      expect(() => logger.debug('debug message'), returnsNormally);
    });

    test('info does not throw', () {
      expect(() => logger.info('info message'), returnsNormally);
    });

    test('warning does not throw, accepts error and stackTrace', () {
      expect(
        () => logger.warning(
          'warning message',
          error: StateError('boom'),
          stackTrace: StackTrace.current,
        ),
        returnsNormally,
      );
    });

    test('error does not throw, accepts error and stackTrace', () {
      expect(
        () => logger.error(
          'error message',
          error: StateError('boom'),
          stackTrace: StackTrace.current,
        ),
        returnsNormally,
      );
    });

    test('accepts a custom name tag', () {
      expect(
        () => logger.warning('tagged', name: 'AuthGate'),
        returnsNormally,
      );
    });

    test('debug, info and warning do not report to crashlytics', () async {
      logger
        ..debug('d')
        ..info('i')
        ..warning('w', error: StateError('boom'));
      await pumpEventQueue();

      verifyZeroInteractions(crashlytics);
    });

    test('error logs to crashlytics and records a non-fatal error', () async {
      final err = StateError('boom');
      final st = StackTrace.current;

      logger.error('error message', error: err, stackTrace: st);
      await pumpEventQueue();

      verify(() => crashlytics.log('[ERROR] error message')).called(1);
      verify(
        () => crashlytics.recordError(
          err,
          st,
          reason: 'error message',
          fatal: false,
        ),
      ).called(1);
    });

    test('error without an error object only logs the message', () async {
      logger.error('plain error');
      await pumpEventQueue();

      verify(() => crashlytics.log('[ERROR] plain error')).called(1);
      verifyNever(
        () => crashlytics.recordError(
          any<dynamic>(),
          any(),
          reason: any<dynamic>(named: 'reason'),
          fatal: any(named: 'fatal'),
        ),
      );
    });
  });
}
