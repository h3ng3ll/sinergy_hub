import '../../../domain/models/i_auth_credentials/i_auth_credentials.dart';

/// Apple-specific implementation of [IAuthCredentials].
///
/// Concrete provider implementation — lives in the data layer. Apple only
/// returns the name/email on the FIRST authorization.
class AppleCredentials implements IAuthCredentials {
  @override
  final String? firstName;

  @override
  final String? lastName;

  @override
  final String? email;

  const AppleCredentials({
    this.firstName,
    this.lastName,
    this.email,
  });

  @override
  bool get hasAny =>
      (firstName?.isNotEmpty ?? false) ||
      (lastName?.isNotEmpty ?? false) ||
      (email?.isNotEmpty ?? false);
}
