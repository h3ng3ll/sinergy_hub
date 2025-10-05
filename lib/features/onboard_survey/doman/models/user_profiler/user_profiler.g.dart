// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profiler.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserProfiler _$UserProfilerFromJson(
  Map<String, dynamic> json,
) => _UserProfiler(
  specialization: $enumDecode(_$ESpecializationEnumMap, json['specialization']),
  role: $enumDecode(_$ERoleEnumMap, json['role']),
  experience: $enumDecode(_$EExperienceEnumMap, json['experience']),
  searchingSpecializations: (json['searchingSpecializations'] as List<dynamic>)
      .map((e) => $enumDecode(_$ESpecializationEnumMap, e))
      .toList(),
);

Map<String, dynamic> _$UserProfilerToJson(_UserProfiler instance) =>
    <String, dynamic>{
      'specialization': _$ESpecializationEnumMap[instance.specialization]!,
      'role': _$ERoleEnumMap[instance.role]!,
      'experience': _$EExperienceEnumMap[instance.experience]!,
      'searchingSpecializations': instance.searchingSpecializations
          .map((e) => _$ESpecializationEnumMap[e]!)
          .toList(),
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

const _$ERoleEnumMap = {
  ERole.technicalDevelopment: 'technicalDevelopment',
  ERole.productManager: 'productManager',
  ERole.design: 'design',
  ERole.businessMarketing: 'businessMarketing',
  ERole.other: 'other',
};

const _$EExperienceEnumMap = {
  EExperience.junior: 'junior',
  EExperience.middle: 'middle',
  EExperience.senior: 'senior',
  EExperience.leadExpert: 'leadExpert',
};
