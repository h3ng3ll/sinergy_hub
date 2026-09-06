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
  String get appName => '[DEV] Synergy Hub';
}
