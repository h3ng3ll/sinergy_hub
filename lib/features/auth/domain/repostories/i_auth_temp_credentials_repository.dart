import '../models/i_auth_credentials/i_auth_credentials.dart';

/// Persists the credentials captured during open authorization so they can be
/// read back later (e.g. to prefill onboarding). Cache only — a single record,
/// overwritten on every sign-in.
abstract class IAuthTempCredentialsRepository {
  Future<void> save(IAuthCredentials credentials);

  IAuthCredentials? get();

  Future<void> clear();
}
