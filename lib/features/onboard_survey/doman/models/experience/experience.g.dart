// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experience.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Experience _$ExperienceFromJson(Map<String, dynamic> json) => _Experience(
  name: json['name'] as String,
  experience: $enumDecode(_$EExperienceEnumMap, json['experience']),
  rangeExperience: json['rangeExperience'] as String,
  description: json['description'] as String,
  icon: json['icon'] as String? ?? '',
);

Map<String, dynamic> _$ExperienceToJson(_Experience instance) =>
    <String, dynamic>{
      'name': instance.name,
      'experience': _$EExperienceEnumMap[instance.experience]!,
      'rangeExperience': instance.rangeExperience,
      'description': instance.description,
      'icon': instance.icon,
    };

const _$EExperienceEnumMap = {
  EExperience.junior: 'junior',
  EExperience.middle: 'middle',
  EExperience.senior: 'senior',
  EExperience.leadExpert: 'leadExpert',
};
