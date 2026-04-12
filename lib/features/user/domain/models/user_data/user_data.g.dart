// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserData _$UserDataFromJson(Map<String, dynamic> json) => _UserData(
  uid: json['uid'] as String,
  avatarUrl: json['avatarUrl'] as String?,
  avatarPath: json['avatarPath'] as String?,
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  age: (json['age'] as num?)?.toInt(),
  aboutMe: json['aboutMe'] as String?,
  profiler: UserProfiler.fromJson(json['profiler'] as Map<String, dynamic>),
  createdAt: const TimestampConverter().fromJson(
    json['createdAt'] as Timestamp?,
  ),
  isOnline: json['isOnline'] ?? false,
  lastSeen: const TimestampConverter().fromJson(json['lastSeen'] as Timestamp?),
);

Map<String, dynamic> _$UserDataToJson(_UserData instance) => <String, dynamic>{
  'uid': instance.uid,
  'avatarUrl': instance.avatarUrl,
  'avatarPath': instance.avatarPath,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'age': instance.age,
  'aboutMe': instance.aboutMe,
  'profiler': instance.profiler.toJson(),
  'createdAt': const TimestampConverter().toJson(instance.createdAt),
  'isOnline': instance.isOnline,
  'lastSeen': const TimestampConverter().toJson(instance.lastSeen),
};
