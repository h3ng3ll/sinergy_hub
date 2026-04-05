// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatMessageDto _$ChatMessageDtoFromJson(Map<String, dynamic> json) =>
    _ChatMessageDto(
      id: json['id'] as String? ?? '',
      message: json['message'] as String? ?? '',
      sentUid: json['sentUid'] as String? ?? '',
      readStatus:
          (json['readStatus'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      createdAt: const TimestampConverter().fromJson(
        json['createdAt'] as Timestamp?,
      ),
    );

Map<String, dynamic> _$ChatMessageDtoToJson(_ChatMessageDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'sentUid': instance.sentUid,
      'readStatus': instance.readStatus,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
