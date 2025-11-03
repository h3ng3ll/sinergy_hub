// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_data_pg_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UsersDataPgState _$UsersDataPgStateFromJson(Map<String, dynamic> json) =>
    _UsersDataPgState(
      startIndex: (json['startIndex'] as num?)?.toInt() ?? 0,
      pageSize: (json['pageSize'] as num?)?.toInt() ?? 10,
      excludedUids:
          (json['excludedUids'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toSet() ??
          const {},
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => UserData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$UsersDataPgStateToJson(_UsersDataPgState instance) =>
    <String, dynamic>{
      'startIndex': instance.startIndex,
      'pageSize': instance.pageSize,
      'excludedUids': instance.excludedUids.toList(),
      'items': instance.items.map((e) => e.toJson()).toList(),
    };
