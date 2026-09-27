import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_location.g.dart';

part 'user_location.freezed.dart';

/// Public location text on `users/{uid}.location` — see
/// `docs/location_backend_contract.md` §1.
///
/// Carries no coordinates. `hasCoordinates` is a UI hint only: it is set by
/// the backend when `updateUserCoordinates` succeeds, and a security rule
/// forbids the client from changing it — the client must always copy the
/// existing value forward on save, never force it to `true` itself.
@freezed
sealed class UserLocation with _$UserLocation {
  const UserLocation._();

  const factory UserLocation({
    String? country,
    String? city,
    String? countryCode,
    String? countryKey,
    String? cityKey,
    @Default(false) bool hasCoordinates,
  }) = _UserLocation;

  /// Builds a [UserLocation] from user-editable display text, normalising
  /// `countryKey` / `cityKey` to `trim().toLowerCase()` (or `null` when the
  /// text is empty). `hasCoordinates` is always carried forward from the
  /// previous value — never forced `true` here.
  factory UserLocation.fromText({
    required String? country,
    required String? city,
    String? countryCode,
    required bool hasCoordinates,
  }) {
    final normalizedCountry = _normalize(country);
    final normalizedCity = _normalize(city);
    return UserLocation(
      country: normalizedCountry,
      city: normalizedCity,
      countryCode: normalizedCountry == null ? null : countryCode,
      countryKey: normalizedCountry?.toLowerCase(),
      cityKey: normalizedCity?.toLowerCase(),
      hasCoordinates: hasCoordinates,
    );
  }

  factory UserLocation.fromJson(Map<String, dynamic> json) =>
      _$UserLocationFromJson(json);

  static String? _normalize(String? value) {
    final trimmed = value?.trim();
    if (trimmed == null || trimmed.isEmpty) return null;
    return trimmed;
  }
}
