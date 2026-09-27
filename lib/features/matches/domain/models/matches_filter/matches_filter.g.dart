// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matches_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MatchesFilter _$MatchesFilterFromJson(Map<String, dynamic> json) =>
    _MatchesFilter(
      experience: $enumDecodeNullable(_$EExperienceEnumMap, json['experience']),
      specialization: $enumDecodeNullable(
        _$ESpecializationEnumMap,
        json['specialization'],
      ),
      skills:
          (json['skills'] as List<dynamic>?)
              ?.map((e) => Skill.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      locationMode: $enumDecodeNullable(
        _$ELocationFilterModeEnumMap,
        json['locationMode'],
      ),
      country: json['country'] as String?,
      city: json['city'] as String?,
      radiusKm: (json['radiusKm'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MatchesFilterToJson(_MatchesFilter instance) =>
    <String, dynamic>{
      'experience': _$EExperienceEnumMap[instance.experience],
      'specialization': _$ESpecializationEnumMap[instance.specialization],
      'skills': instance.skills.map((e) => e.toJson()).toList(),
      'locationMode': _$ELocationFilterModeEnumMap[instance.locationMode],
      'country': instance.country,
      'city': instance.city,
      'radiusKm': instance.radiusKm,
    };

const _$EExperienceEnumMap = {
  EExperience.junior: 'junior',
  EExperience.middle: 'middle',
  EExperience.senior: 'senior',
  EExperience.leadExpert: 'leadExpert',
};

const _$ESpecializationEnumMap = {
  ESpecialization.frontendDeveloper: 'frontendDeveloper',
  ESpecialization.mobileDeveloper: 'mobileDeveloper',
  ESpecialization.backendDeveloper: 'backendDeveloper',
  ESpecialization.fullStackDeveloper: 'fullStackDeveloper',
  ESpecialization.devopsEngineer: 'devopsEngineer',
  ESpecialization.dataScientistMLEngineer: 'dataScientistMLEngineer',
  ESpecialization.qaTestAutomation: 'qaTestAutomation',
  ESpecialization.techLeadCTO: 'techLeadCTO',
  ESpecialization.productManager: 'productManager',
  ESpecialization.productOwner: 'productOwner',
  ESpecialization.uiUxDesigner: 'uiUxDesigner',
  ESpecialization.productDesigner: 'productDesigner',
  ESpecialization.marketingManager: 'marketingManager',
  ESpecialization.growthManager: 'growthManager',
  ESpecialization.salesManager: 'salesManager',
  ESpecialization.businessDeveloper: 'businessDeveloper',
  ESpecialization.technicalCoFounder: 'technicalCoFounder',
  ESpecialization.nonTechnicalCoFounder: 'nonTechnicalCoFounder',
};

const _$ELocationFilterModeEnumMap = {
  ELocationFilterMode.place: 'place',
  ELocationFilterMode.radius: 'radius',
};
