import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'failures/geo_failures.dart';
import 'i_geolocation_service.dart';
import 'models/e_geo_permission.dart';
import 'models/e_geo_settings_target.dart';
import 'models/geo_place.dart';
import 'models/geo_position.dart';

class GeolocatorGeolocationService implements IGeolocationService {
  final Geocoding _geocoding = Geocoding();

  bool get _isIOS => !kIsWeb && defaultTargetPlatform == TargetPlatform.iOS;

  @override
  Future<Either<EGeoPermission, GeoFailure>> requestPermission() async {
    if (!kIsWeb) {
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return Right(
          GeoServiceDisabledFailure(
            _isIOS
                ? 'Location Services are turned off. Open Settings → Privacy & '
                      'Security → Location Services, switch them on, then tap '
                      '"Use my location" again.'
                : 'Location is turned off. Switch on Location in your device '
                      'settings, then tap "Use my location" again.',
          ),
        );
      }
    }

    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    switch (permission) {
      case LocationPermission.whileInUse:
        return const Left(EGeoPermission.whileInUse);
      case LocationPermission.always:
        return const Left(EGeoPermission.always);
      case LocationPermission.deniedForever:
        return Right(
          GeoPermissionPermanentlyDeniedFailure(
            _isIOS
                ? 'Location access is off for this app. Open Settings, tap '
                      'Location and choose "While Using the App".'
                : 'Location permission is blocked. Open Settings → '
                      'Permissions → Location and choose "Allow only while '
                      'using the app".',
          ),
        );
      case LocationPermission.denied:
      case LocationPermission.unableToDetermine:
        return const Right(GeoPermissionDeniedFailure());
    }
  }

  @override
  Future<GeoPosition> currentPosition() async {
    final position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
      ),
    );

    return GeoPosition(
      latitude: position.latitude,
      longitude: position.longitude,
      accuracyMeters: position.accuracy,
      capturedAt: position.timestamp,
    );
  }

  @override
  Future<GeoPlace?> reverseGeocode(GeoPosition position) async {
    if (kIsWeb) return null;
    try {
      final placemarks = await _geocoding.placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      if (placemarks.isEmpty) return null;
      final placemark = placemarks.first;
      return GeoPlace(
        country: placemark.country,
        countryCode: placemark.isoCountryCode,
        city: placemark.locality,
      );
    } catch (_) {
      return null;
    }
  }

  /// iOS doesn't allow deep-linking into Location Services, so
  /// `openLocationSettings` lands on this app's page there; the
  /// [GeoServiceDisabledFailure] message spells out the path for that case.
  @override
  Future<void> openSettings(EGeoSettingsTarget target) async {
    switch (target) {
      case EGeoSettingsTarget.locationServices:
        await Geolocator.openLocationSettings();
      case EGeoSettingsTarget.appSettings:
        await Geolocator.openAppSettings();
    }
  }
}
