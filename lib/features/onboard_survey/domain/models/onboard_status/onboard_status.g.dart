// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboard_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OnboardStatus _$OnboardStatusFromJson(Map<String, dynamic> json) =>
    _OnboardStatus(
      toldAboutYourself: json['toldAboutYourself'] as bool? ?? false,
      completeSpecialization: json['completeSpecialization'] as bool? ?? false,
      completedMatchTutorial: json['completedMatchTutorial'] as bool? ?? false,
      completedChatTutorial: json['completedChatTutorial'] as bool? ?? false,
    );

Map<String, dynamic> _$OnboardStatusToJson(_OnboardStatus instance) =>
    <String, dynamic>{
      'toldAboutYourself': instance.toldAboutYourself,
      'completeSpecialization': instance.completeSpecialization,
      'completedMatchTutorial': instance.completedMatchTutorial,
      'completedChatTutorial': instance.completedChatTutorial,
    };
