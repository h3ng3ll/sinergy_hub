/// Provider-agnostic abstraction for the user identity returned by an
/// open-auth provider (Apple today, Google/etc. in the future).
///
/// Lives in the domain layer as the contract between layers; concrete
/// implementations (e.g. `AppleCredentials`) live in the data layer. Providers
/// typically only return these fields on the FIRST authorization.
abstract class IAuthCredentials {
  String? get firstName;

  String? get lastName;

  String? get email;

  /// Whether the provider actually returned any usable field this time
  /// (repeat authorizations send all-null).
  bool get hasAny =>
      (firstName?.isNotEmpty ?? false) ||
      (lastName?.isNotEmpty ?? false) ||
      (email?.isNotEmpty ?? false);
}
