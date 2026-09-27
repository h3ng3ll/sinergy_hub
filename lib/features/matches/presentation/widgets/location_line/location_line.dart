import 'package:flutter/material.dart';

import 'format_distance_km.dart';

/// "📍 City, Country · ~12 km" — every part is optional, and the whole line
/// is hidden when city, country and distance are all empty. Shared by the
/// Home swipe card and the Liked-you card.
class LocationLine extends StatelessWidget {
  final String? city;
  final String? country;
  final double? distanceKm;
  final TextStyle? style;

  const LocationLine({
    super.key,
    this.city,
    this.country,
    this.distanceKm,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final placeParts = [
      city,
      country,
    ].whereType<String>().where((e) => e.trim().isNotEmpty).toList();
    final placePart = placeParts.isEmpty ? null : placeParts.join(', ');

    final distance = distanceKm;
    String? distancePart;
    if (distance != null) {
      final formatted = formatDistanceKm(distance);
      distancePart = formatted.startsWith('<') || formatted.endsWith('+ km')
          ? formatted
          : '~$formatted';
    }

    if (placePart == null && distancePart == null) {
      return const SizedBox.shrink();
    }

    final text = [
      placePart,
      distancePart,
    ].whereType<String>().join(' · ');

    return Text(
      '📍 $text',
      style: style,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
