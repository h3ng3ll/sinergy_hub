// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserLocation _$UserLocationFromJson(Map<String, dynamic> json) =>
    _UserLocation(
      country: json['country'] as String?,
      city: json['city'] as String?,
      countryCode: json['countryCode'] as String?,
      countryKey: json['countryKey'] as String?,
      cityKey: json['cityKey'] as String?,
      hasCoordinates: json['hasCoordinates'] as bool? ?? false,
    );

Map<String, dynamic> _$UserLocationToJson(_UserLocation instance) =>
    <String, dynamic>{
      'country': instance.country,
      'city': instance.city,
      'countryCode': instance.countryCode,
      'countryKey': instance.countryKey,
      'cityKey': instance.cityKey,
      'hasCoordinates': instance.hasCoordinates,
    };
