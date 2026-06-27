import 'dart:convert';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter_test/flutter_test.dart';
import 'package:sinergy_hub/firebase/firebase_options_dev.dart' as dev;
import 'package:sinergy_hub/firebase/firebase_options_prod.dart' as prod;

/// Expected Realtime Database URLs per flavor.
///
/// These are pinned on purpose: the production presence/status feature once
/// broke silently because [FirebaseOptions.databaseURL] was missing in the
/// prod options (FlutterFire generated the file without it), and
/// `FirebaseDatabase.instance` had no endpoint to talk to. These tests fail
/// loudly if either flavor's URL is ever blanked, dropped, or drifts away from
/// the native Firebase config (the source of truth).
const _prodUrl =
    'https://sinergyhub-prod-default-rtdb.europe-west1.firebasedatabase.app';
const _devUrl =
    'https://synergyhub-a3e1b-default-rtdb.europe-west1.firebasedatabase.app';

/// Reads `project_info.firebase_url` from an Android `google-services.json`.
String _androidFirebaseUrl(String path) {
  final json =
      jsonDecode(File(path).readAsStringSync()) as Map<String, dynamic>;
  return (json['project_info'] as Map<String, dynamic>)['firebase_url']
      as String;
}

/// Extracts the `DATABASE_URL` value from an iOS `GoogleService-Info.plist`.
///
/// Parsed with a regex rather than a plist package to avoid adding a test-only
/// dependency.
String _iosDatabaseUrl(String path) {
  final content = File(path).readAsStringSync();
  final match = RegExp(
    r'<key>DATABASE_URL</key>\s*<string>([^<]+)</string>',
  ).firstMatch(content);
  expect(match, isNotNull, reason: 'DATABASE_URL missing in $path');
  return match!.group(1)!;
}

void main() {
  group('Firebase databaseURL — production', () {
    final opts = <String, FirebaseOptions>{
      'web': prod.DefaultFirebaseOptions.web,
      'android': prod.DefaultFirebaseOptions.android,
      'ios': prod.DefaultFirebaseOptions.ios,
      'macos': prod.DefaultFirebaseOptions.macos,
      'windows': prod.DefaultFirebaseOptions.windows,
    };

    opts.forEach((platform, o) {
      test('$platform databaseURL is set and correct', () {
        expect(
          o.databaseURL,
          isNotNull,
          reason: 'prod $platform databaseURL must not be null',
        );
        expect(o.databaseURL, isNotEmpty);
        expect(o.databaseURL, equals(_prodUrl));
      });
    });

    test('matches Android google-services.json (source of truth)', () {
      expect(
        _androidFirebaseUrl('android/app/src/prod/google-services.json'),
        equals(_prodUrl),
      );
    });

    test('matches iOS GoogleService-Info.plist (source of truth)', () {
      expect(
        _iosDatabaseUrl(
          'ios/Runner/flavors/production/GoogleService-Info.plist',
        ),
        equals(_prodUrl),
      );
    });
  });

  group('Firebase databaseURL — development', () {
    final opts = <String, FirebaseOptions>{
      'web': dev.DefaultFirebaseOptions.web,
      'android': dev.DefaultFirebaseOptions.android,
      'ios': dev.DefaultFirebaseOptions.ios,
      'macos': dev.DefaultFirebaseOptions.macos,
      'windows': dev.DefaultFirebaseOptions.windows,
    };

    opts.forEach((platform, o) {
      test('$platform databaseURL is set and correct', () {
        expect(
          o.databaseURL,
          isNotNull,
          reason: 'dev $platform databaseURL must not be null',
        );
        expect(o.databaseURL, isNotEmpty);
        expect(o.databaseURL, equals(_devUrl));
      });
    });

    test('matches Android google-services.json (source of truth)', () {
      expect(
        _androidFirebaseUrl('android/app/src/development/google-services.json'),
        equals(_devUrl),
      );
    });

    test('matches iOS GoogleService-Info.plist (source of truth)', () {
      expect(
        _iosDatabaseUrl(
          'ios/Runner/flavors/development/GoogleService-Info.plist',
        ),
        equals(_devUrl),
      );
    });
  });

  test('production and development point at different databases', () {
    expect(_prodUrl, isNot(equals(_devUrl)));
  });
}
