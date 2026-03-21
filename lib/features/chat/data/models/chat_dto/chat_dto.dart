// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:collection/collection.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
//
// import '../../../../../core/utils/converters/timestamp_convertor.dart';
// import '../../../../onboard_survey/domain/models/specialization/specialization.dart';
// import '../../../domain/models/chat/chat.dart';
// import '../../../domain/models/chat_info/chat_info.dart';
// import '../../../domain/models/participant_info/participant_info.dart';
// import '../chat_config_dto/chat_config_dto.dart';
//
// part 'chat_dto.g.dart';
//
// part 'chat_dto.freezed.dart';
//
// @freezed
// abstract class ChatDto with _$ChatDto {
//   const ChatDto._();
//
//   const factory ChatDto({
//     @Default('') String chatId,
//     @Default('') String lastMessage,
//     @Default([]) List<String> typingUsers,
//     @TimestampConverter() required DateTime lastMessageSent,
//     @Default([]) List<String> searchKeywords,
//     @Default(false) hasRead,
//     @Default([]) List<String> archived,
//     @Default([]) List<String> favorite,
//     @Default({}) Map<String, List<ParticipantInfo>> participantInfo,
//     @Default(ChatConfigDto()) ChatConfigDto config,
//
//     /// who access this chat
//     required List<String> participants,
//     @TimestampConverter() required DateTime createdAt,
//   }) = _ChatDto;
//
//   factory ChatDto.fromJson(
//     Map<String, Object?> json,
//   ) => _$ChatDtoFromJson(
//     json,
//   );
//
//   Chat toDomain({
//     required String uid,
//   }) {
//     // final ParticipantInfo? inf = participantInfo.firstWhereOrNull(
//     //   (e) => e.id != uid,
//     // );
//     //
//     // final info = ChatInfo(
//     //   specialization:
//     //       ESpecialization.values.firstWhereOrNull(
//     //         (e) => e.name == inf?.specialization,
//     //       ) ??
//     //       ESpecialization.backendDeveloper,
//     //   title: inf?.name ?? '',
//     //   cover: inf?.avatarUrl,
//     // );
//     return Chat(
//       chatId: chatId,
//       lastMessage: lastMessage,
//       lastMessageSent: lastMessageSent,
//       participants: participants,
//       createdAt: createdAt,
//       typingUsers: typingUsers,
//       config: config.toDomain(),
//       // isArchived: config.archived.contains(
//       //   uid,
//       // ),
//       // isFavorite: config.favorite.contains(
//       //   uid,
//       // ),
//       // info: info,
//       participantInfo: participantInfo,
//
//     );
//   }
//
//   factory ChatDto.fromDomain(
//     Chat chat,
//   ) => ChatDto(
//     chatId: chat.chatId,
//     lastMessage: chat.lastMessage,
//     typingUsers: chat.typingUsers,
//     lastMessageSent: chat.lastMessageSent,
//     participants: chat.participants,
//     createdAt: chat.createdAt,
//     config: chat.config, ChatConfigDto(
//       archived: chat.isArchived ? [uid] : [],
//       favorite: chat.isFavorite ? [uid] : [],
//     ),
//   );
// }
