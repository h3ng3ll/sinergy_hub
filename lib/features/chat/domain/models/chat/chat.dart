import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../onboard_survey/domain/models/specialization/specialization.dart';
import '../../../../user/domain/models/user_data/user_data.dart';
import '../chat_info/chat_info.dart';

part 'chat.g.dart';

part 'chat.freezed.dart';

@freezed
abstract class Chat with _$Chat {
  const factory Chat({
    @Default('') String chatId,
    required ChatInfo info,
    @Default('') String lastMessage,
    required DateTime lastMessageSent,
    @Default([]) List<String> typingUsers,

    /// who access this chat
    required List<String> participants,
    @Default(false) bool hasRead,
    @Default(false) bool isArchived,
    @Default(false) bool isFavorite,
    required DateTime createdAt,
    @Default('') String icon,
  }) = _Chat;

  @visibleForTesting
  factory Chat.empty() => Chat(
    chatId: '',
    info: ChatInfo(
      specialization: ESpecialization.backendDeveloper,
    ),
    lastMessage: '',
    lastMessageSent: DateTime.now(),
    typingUsers: [],
    participants: [],
    hasRead: false,
    isArchived: false,
    isFavorite: false,
    createdAt: DateTime.now(),
    icon: '',
  );

  factory Chat.fromJson(
    Map<String, Object?> json,
  ) => _$ChatFromJson(
    json,
  );
}
