import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../user/domain/models/user_data/user_data.dart';

part 'chat_message.g.dart';

part 'chat_message.freezed.dart';

@freezed
sealed class ChatMessage with _$ChatMessage {
  const factory ChatMessage({
    @Default('') String id,
    @Default('') String message,
    @Default('') String sentUid,
    required DateTime createdAt,
  }) = _ChatMessage;

  factory ChatMessage.fromJson(
    Map<String, Object?> json,
  ) => _$ChatMessageFromJson(json);
}
