import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../user/domain/models/user_data/user_data.dart';

part 'chat.g.dart';

part 'chat.freezed.dart';

@freezed
sealed class Chat with _$Chat {
  const factory Chat({
    @Default('') String chatId,
    required UserData user,
    @Default('') String lastMessage,
    required DateTime lastMessageSent,

    /// who access this chat
    required List<String> participants,

    required DateTime createdAt,
    @Default('') String icon,
  }) = _Chat;

  factory Chat.fromJson(Map<String, Object?> json) => _$ChatFromJson(json);
}
