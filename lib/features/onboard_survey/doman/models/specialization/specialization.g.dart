// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specialization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Specialization _$SpecializationFromJson(Map<String, dynamic> json) =>
    _Specialization(
      name: json['name'] as String,
      specialization: $enumDecode(
        _$ESpecializationEnumMap,
        json['specialization'],
      ),
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
      'specialization': _$ESpecializationEnumMap[instance.specialization]!,
      'particulars': instance.particulars,
      'colors': instance.colors.map(const ColorSerializable().toJson).toList(),
      'icon': instance.icon,
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
