// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'liked_you_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LikedYouItem _$LikedYouItemFromJson(Map json) => _LikedYouItem(
  likeId: json['likeId'] as String,
  likedAt: DateTime.parse(json['likedAt'] as String),
  isLocked: json['isLocked'] as bool,
  imageState:
      $enumDecodeNullable(
        _$EImageStateEnumMap,
        json['imageState'],
        unknownValue: EImageState.none,
      ) ??
      EImageState.none,
  imageUrl: json['imageUrl'] as String?,
  uid: json['uid'] as String?,
  firstName: json['firstName'] as String?,
  age: (json['age'] as num?)?.toInt(),
  specialization: $enumDecodeNullable(
    _$ESpecializationEnumMap,
    json['specialization'],
    unknownValue: JsonKey.nullForUndefinedEnumValue,
  ),
  experience: $enumDecodeNullable(
    _$EExperienceEnumMap,
    json['experience'],
    unknownValue: JsonKey.nullForUndefinedEnumValue,
  ),
  skills:
      (json['skills'] as List<dynamic>?)
          ?.map((e) => Skill.fromJson(Map<String, Object?>.from(e as Map)))
          .toList() ??
      const <Skill>[],
  city: json['city'] as String?,
  country: json['country'] as String?,
  distanceKm: (json['distanceKm'] as num?)?.toDouble(),
);

Map<String, dynamic> _$LikedYouItemToJson(_LikedYouItem instance) =>
    <String, dynamic>{
      'likeId': instance.likeId,
      'likedAt': instance.likedAt.toIso8601String(),
      'isLocked': instance.isLocked,
      'imageState': _$EImageStateEnumMap[instance.imageState]!,
      'imageUrl': instance.imageUrl,
      'uid': instance.uid,
      'firstName': instance.firstName,
      'age': instance.age,
      'specialization': _$ESpecializationEnumMap[instance.specialization],
      'experience': _$EExperienceEnumMap[instance.experience],
      'skills': instance.skills.map((e) => e.toJson()).toList(),
      'city': instance.city,
      'country': instance.country,
      'distanceKm': instance.distanceKm,
    };

const _$EImageStateEnumMap = {
  EImageState.clear: 'clear',
  EImageState.blurred: 'blurred',
  EImageState.none: 'none',
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

const _$EExperienceEnumMap = {
  EExperience.junior: 'junior',
  EExperience.middle: 'middle',
  EExperience.senior: 'senior',
  EExperience.leadExpert: 'leadExpert',
};
