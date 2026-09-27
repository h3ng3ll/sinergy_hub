/// Formats a distance in km for display on a card, per
/// `docs/location_backend_contract.md` §7:
/// `0.5` → "< 1 km"; under 10 → one decimal; under 500 → rounded;
/// 500 and above → "500+ km".
String formatDistanceKm(double distanceKm) {
  if (distanceKm < 1.0) return '< 1 km';
  if (distanceKm < 10.0) return '${distanceKm.toStringAsFixed(1)} km';
  if (distanceKm < 500.0) return '${distanceKm.round()} km';
  return '500+ km';
}
