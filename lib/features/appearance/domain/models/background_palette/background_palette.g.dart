// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'background_palette.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BackgroundPalette _$BackgroundPaletteFromJson(Map<String, dynamic> json) =>
    _BackgroundPalette(
      primary: const ColorSerializable().fromJson(json['primary'] as String),
      secondary: const ColorSerializable().fromJson(
        json['secondary'] as String,
      ),
    );

Map<String, dynamic> _$BackgroundPaletteToJson(_BackgroundPalette instance) =>
    <String, dynamic>{
      'primary': const ColorSerializable().toJson(instance.primary),
      'secondary': const ColorSerializable().toJson(instance.secondary),
    };
