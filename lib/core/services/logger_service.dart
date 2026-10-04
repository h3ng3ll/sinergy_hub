import 'dart:developer' as developer;

import 'package:firebase_crashlytics/firebase_crashlytics.dart';

/// Application-wide logger.
///
/// Backed by `dart:developer`'s [developer.log], consistent with the bloc
/// observer. Levels map to the standard `package:logging` numeric levels so
/// they render with the expected severity in tooling:
/// DEBUG=500, INFO=800, WARNING=900, ERROR=1000.
class LoggerService {
  static const String _defaultName = 'App';
  final FirebaseCrashlytics _crashlytics;

  LoggerService({
    required this._crashlytics,
  });

  void debug(
    String message, {
    String name = _defaultName,
  }) {
    developer.log(
      message,
      level: 500,
      name: name,
    );
  }

  void info(
    String message, {
    String name = _defaultName,
  }) {
    developer.log(
      message,
      level: 800,
      name: name,
    );
  }

  void warning(
    String message, {
    Object? error,
    StackTrace? stackTrace,
    String name = _defaultName,
  }) {
    developer.log(
      message,
      level: 900,
      name: name,
      error: error,
      stackTrace: stackTrace,
    );
  }

  void error(
    String message, {
    Object? error,
    StackTrace? stackTrace,
    String name = _defaultName,
  }) async {
    _crashlytics.log('[ERROR] $message');

    if (error != null) {
      await _crashlytics.recordError(
        error,
        stackTrace ?? StackTrace.current,
        reason: message,
        fatal: false,
      );
    }
    developer.log(
      message,
      level: 1000,
      name: name,
      error: error,
      stackTrace: stackTrace,
    );
  }
}
