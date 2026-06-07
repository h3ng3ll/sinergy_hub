import 'package:flutter_test/flutter_test.dart';
import 'package:sinergy_hub/core/services/logger_service.dart';

void main() {
  late LoggerService logger;

  setUp(() {
    logger = LoggerService();
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
  });
}
