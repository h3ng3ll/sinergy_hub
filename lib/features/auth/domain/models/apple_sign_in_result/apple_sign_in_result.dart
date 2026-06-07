import 'package:firebase_auth/firebase_auth.dart';

import '../i_auth_credentials/i_auth_credentials.dart';

/// Result of a successful Apple sign-in.
///
/// Carries the Firebase [userCredential] plus the [credentials] the provider
/// returned (name/email — only present on the first authorization), expressed
/// through the provider-agnostic [IAuthCredentials] abstraction so the use case
/// can persist them without the repository depending on another repository.
class AppleSignInResult {
  final UserCredential? userCredential;
  final IAuthCredentials credentials;

  const AppleSignInResult({
    required this.userCredential,
    required this.credentials,
  });
}
