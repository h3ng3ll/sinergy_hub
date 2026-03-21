import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_payload.g.dart';

part 'chat_payload.freezed.dart';

@freezed
sealed class ChatPayload with _$ChatPayload {
  const factory ChatPayload({
    @Default('') String type,
    @Default('') String chatId,
    @Default('') String sentUid,
  }) = _ChatPayload;

  factory ChatPayload.fromJson(
    Map<String, Object?> json,
  ) => _$ChatPayloadFromJson(json);
}
