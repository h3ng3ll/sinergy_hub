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
    @Default('')  String lastMessageSentBy,
    required ChatConfig config,
    @Default([]) List<String> typingUsers,
    @Default({}) Map<String, ParticipantInfo> participantInfo,

    /// Per-user block flags keyed by userId. A missing key means the user
    /// has not blocked the chat (default false).
    @JsonKey(fromJson: _blockedFromJson)
    @Default({}) Map<String, bool> blocked,

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

/// Defensively coerces the stored `blocked` map into `Map<String, bool>`,
/// tolerating null / non-bool values that may appear from the web client.
Map<String, bool> _blockedFromJson(dynamic value) {
  if (value is Map) {
    return value.map(
      (key, val) => MapEntry(key.toString(), val == true),
    );
  }
  return {};
}

extension ChatX on Chat {
  String? otherUserUid(String uid) => participants.firstWhereOrNull(
    (p) => p != uid && p.isNotEmpty,
  );

  /// Whether [uid] has blocked this chat.
  bool isBlockedBy(String uid) => blocked[uid] == true;

  /// Whether any participant has blocked the chat — messaging is restricted.
  bool get anyBlocked => blocked.values.any((b) => b);

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
