import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'env.dart';

class DevEnv extends Env {
  @override
  String serverClientId() {
    return kIsWeb
        ? const String.fromEnvironment(
            'DEV_SERVER_CLIENT_ID',
          )
        : dotenv.get(
            'DEV_SERVER_CLIENT_ID',
          );
  }

  @override
  String webPushCertificate() => kIsWeb
      ? const String.fromEnvironment(
          'DEV_FIREBASE_WEB_PUSH_CERTIFICATE',
        )
      : dotenv.get(
          'DEV_FIREBASE_WEB_PUSH_CERTIFICATE',
        );

  @override
  String revenueCatAppleApiKey() => kIsWeb
      ? const String.fromEnvironment(
          'DEV_REVENUECAT_APPLE_API_KEY',
        )
      : dotenv.maybeGet(
          'DEV_REVENUECAT_APPLE_API_KEY',
          fallback: '',
        )!;

  @override
  String revenueCatGoogleApiKey() => kIsWeb
      ? const String.fromEnvironment(
          'DEV_REVENUECAT_GOOGLE_API_KEY',
        )
      : dotenv.maybeGet(
          'DEV_REVENUECAT_GOOGLE_API_KEY',
          fallback: '',
        )!;

  @override
  String get appName => '[DEV] Synergy Hub';
}
