import 'env.dart';

class ProdEnv extends Env {
  @override
  String webPushCertificate() => const String.fromEnvironment(
    'PROD_FIREBASE_WEB_PUSH_CERTIFICATE',
  );

  @override
  String serverClientId() => const String.fromEnvironment(
    'PROD_SERVER_CLIENT_ID',
  );
}
