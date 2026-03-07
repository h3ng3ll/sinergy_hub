// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatDto _$ChatDtoFromJson(Map<String, dynamic> json) => _ChatDto(
  chatId: json['chatId'] as String? ?? '',
  lastMessage: json['lastMessage'] as String? ?? '',
  typingUsers:
      (json['typingUsers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  lastMessageSent: const TimestampConverter().fromJson(
    json['lastMessageSent'] as Timestamp,
  ),
  searchKeywords:
      (json['searchKeywords'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  isArchived: json['isArchived'] ?? false,
  isFavorite: json['isFavorite'] ?? false,
  hasRead: json['hasRead'] ?? false,
  participants: (json['participants'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  createdAt: const TimestampConverter().fromJson(
    json['createdAt'] as Timestamp,
  ),
);

Map<String, dynamic> _$ChatDtoToJson(_ChatDto instance) => <String, dynamic>{
  'chatId': instance.chatId,
  'lastMessage': instance.lastMessage,
  'typingUsers': instance.typingUsers,
  'lastMessageSent': const TimestampConverter().toJson(
    instance.lastMessageSent,
  ),
  'searchKeywords': instance.searchKeywords,
  'isArchived': instance.isArchived,
  'isFavorite': instance.isFavorite,
  'hasRead': instance.hasRead,
  'participants': instance.participants,
  'createdAt': const TimestampConverter().toJson(instance.createdAt),
};
