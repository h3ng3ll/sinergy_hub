import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../firebase/firebase_options_dev.dart' as dev;
import 'env.dart';

class DevEnv extends Env {

  @override
  String serverClientId() {
    return dotenv.get('DEV_SERVER_CLIENT_ID');
  }

  @override
  String webPushCertificate() =>  dotenv.get('DEV_FIREBASE_WEB_PUSH_CERTIFICATE');
}
