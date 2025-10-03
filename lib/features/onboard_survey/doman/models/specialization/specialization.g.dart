// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specialization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Specialization _$SpecializationFromJson(Map<String, dynamic> json) =>
    _Specialization(
      name: json['name'] as String,
      particulars: (json['particulars'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      colors:
          (json['colors'] as List<dynamic>?)
              ?.map((e) => const ColorSerializable().fromJson(e as String))
              .toList() ??
          const [],
      icon: json['icon'] as String? ?? '',
    );

Map<String, dynamic> _$SpecializationToJson(_Specialization instance) =>
    <String, dynamic>{
      'name': instance.name,
      'particulars': instance.particulars,
      'colors': instance.colors.map(const ColorSerializable().toJson).toList(),
      'icon': instance.icon,
    };
