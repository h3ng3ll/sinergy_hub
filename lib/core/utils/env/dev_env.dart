import 'env.dart';

class DevEnv extends Env {
  @override
  String serverClientId() {
    return const String.fromEnvironment(
      'DEV_SERVER_CLIENT_ID',
    );
  }

  @override
  String webPushCertificate() => const String.fromEnvironment(
    'DEV_FIREBASE_WEB_PUSH_CERTIFICATE',
  );
}
