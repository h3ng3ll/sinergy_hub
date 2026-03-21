// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatInfo _$ChatInfoFromJson(Map<String, dynamic> json) => _ChatInfo(
  title: json['title'] as String? ?? '',
  cover: json['cover'] as String?,
  specialization: $enumDecode(_$ESpecializationEnumMap, json['specialization']),
);

Map<String, dynamic> _$ChatInfoToJson(_ChatInfo instance) => <String, dynamic>{
  'title': instance.title,
  'cover': instance.cover,
  'specialization': _$ESpecializationEnumMap[instance.specialization]!,
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
