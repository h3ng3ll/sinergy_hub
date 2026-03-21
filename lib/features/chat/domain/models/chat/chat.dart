import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/utils/converters/timestamp_convertor.dart';
import '../../../../onboard_survey/domain/models/specialization/specialization.dart';
import '../../../../onboard_survey/domain/models/specializations/specializations.dart';
import '../chat_config/chat_config.dart';
import '../participant_info/participant_info.dart';

part 'chat.g.dart';

part 'chat.freezed.dart';

@freezed
abstract class Chat with _$Chat {
  const factory Chat({
    @Default('') String chatId,
    @Default('') String lastMessage,
    @TimestampConverter() required DateTime lastMessageSent,
    required ChatConfig config,
    @Default([]) List<String> typingUsers,
    @Default({}) Map<String, ParticipantInfo> participantInfo,

    /// who access this chat
    required List<String> participants,

    @TimestampConverter() required DateTime createdAt,
    @Default('') String icon,
    @Default([]) List<String> searchKeywords,
  }) = _Chat;

  @visibleForTesting
  factory Chat.empty() => Chat(
    chatId: '',
    lastMessage: '',
    lastMessageSent: DateTime.now(),
    participants: [],
    typingUsers: [],
    createdAt: DateTime.now(),
    icon: '',
    config: ChatConfig(),
  );

  factory Chat.fromJson(
    Map<String, Object?> json,
  ) => _$ChatFromJson(
    json,
  );
}

extension ChatX on Chat {
  ParticipantInfo? otherUser(String uid) {
    final oUid = participantInfo.keys.firstWhereOrNull(
      (p) => p != uid,
    );

    return participantInfo[oUid];
  }

  String? cover(String uid) => otherUser(
    uid,
  )?.avatarUrl;

  Specialization? specialization(String uid) {
    final specialization = otherUser(uid)?.specialization;
    if (specialization == null) return null;
    return Specializations.getByName(
      specialization,
    );
  }

  String? chatName(String uid) => otherUser(
    uid,
  )?.name;

  bool isArchived(
    String uid,
  ) => config.isArchived(
    uid,
  );

  bool isFavorite(
    String uid,
  ) => config.isFavorite(
    uid,
  );
}
