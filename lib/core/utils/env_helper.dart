class EnvHelper {
  static const dartEnv = String.fromEnvironment(
    'DARTENV',
    defaultValue: 'prod',
  );
  static const String production = 'prod';
  static const String development = 'development';
}
