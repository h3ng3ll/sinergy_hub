import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../firebase/firebase_options_dev.dart' as dev;
import 'env.dart';

class DevConfig extends Env {
  @override
  FirebaseOptions get firebaseOptions =>
      dev.DefaultFirebaseOptions.currentPlatform;

  @override
  set firebaseOptions(
    FirebaseOptions value,
  ) => firebaseOptions = value;

  @override
  String serverClientId() {
    return dotenv.get('DEV_SERVER_CLIENT_ID');
  }
}
