abstract class AppConfig {
  static bool get isQA => true;

  static String emulatorAddress() {
    // return '10.0.2.2';
    return '192.168.68.53';
  }

  static int get firestoreEmulatorPort => 8080;

  static int get authEmulatorPort => 9099;

  static int get functionsEmulatorPort => 5001;
}
