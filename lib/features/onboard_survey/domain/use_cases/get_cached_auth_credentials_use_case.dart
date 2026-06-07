import '../../../auth/domain/models/i_auth_credentials/i_auth_credentials.dart';
import '../../../auth/domain/repostories/i_auth_temp_credentials_repository.dart';

/// Reads the credentials cached during open authorization so the onboarding
/// "Tell about yourself" page can prefill the user's first/last name.
class GetCachedAuthCredentialsUseCase {
  final IAuthTempCredentialsRepository _authTempCredentialsRepository;

  GetCachedAuthCredentialsUseCase({
    required IAuthTempCredentialsRepository authTempCredentialsRepository,
  }) : _authTempCredentialsRepository = authTempCredentialsRepository;

  IAuthCredentials? call() => _authTempCredentialsRepository.get();
}
