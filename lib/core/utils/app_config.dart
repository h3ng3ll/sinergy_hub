abstract class AppConfig {
  /// App Store listing (`https://apps.apple.com/app/id<ID>`). Empty hides
  /// the App Store button on the About page.
  static const String appStoreUrl = 'https://apps.apple.com/app/id6767223876';

  /// Google Play listing for the production package.
  static const String googlePlayUrl =
      'https://play.google.com/store/apps/details?id=com.hengell.synergyhub';

  static bool get isQA => false;

  static String emulatorAddress() {
    // return '10.0.2.2';
    return '192.168.68.52';
  }

  static int get firestoreEmulatorPort => 8080;

  static int get authEmulatorPort => 9099;

  static int get functionsEmulatorPort => 5001;
}
