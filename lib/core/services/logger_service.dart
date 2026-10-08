import 'dart:developer' as developer;

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:talker_flutter/talker_flutter.dart';

/// Application-wide logger.
///
/// Backed by `dart:developer`'s [developer.log], consistent with the bloc
/// observer. Levels map to the standard `package:logging` numeric levels so
/// they render with the expected severity in tooling:
/// DEBUG=500, INFO=800, WARNING=900, ERROR=1000.
class LoggerService {
  static const String _defaultName = 'App';
  final FirebaseCrashlytics _crashlytics;
  final Talker _talker;

  LoggerService({
    required this._crashlytics,
    required this._talker,
  });

  void debug(
    String message, {
    String name = _defaultName,
  }) {
    _talker.debug(
      message,
    );
  }

  void info(
    String message, {
    String name = _defaultName,
  }) {
    _talker.info(
      message,
    );
  }

  void warning(
    String message, {
    Object? error,
    StackTrace? stackTrace,
    String name = _defaultName,
  }) {
    _talker.warning(
      message,
      error,
      stackTrace,
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
    _talker.error(
      message,
      error,
      stackTrace,
    );
  }
}
