// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_temp_credentials.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthTempCredentials _$AuthTempCredentialsFromJson(Map<String, dynamic> json) =>
    _AuthTempCredentials(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$AuthTempCredentialsToJson(
  _AuthTempCredentials instance,
) => <String, dynamic>{
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'email': instance.email,
};
