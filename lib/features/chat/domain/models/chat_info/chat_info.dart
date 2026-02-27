import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../onboard_survey/domain/models/specialization/specialization.dart';
import '../../../../user/domain/models/user_data/user_data.dart';

part 'chat_info.g.dart';

part 'chat_info.freezed.dart';

@freezed
abstract class ChatInfo with _$ChatInfo {
  const factory ChatInfo({
    @Default('') String title,
    @Default('') String lastMessage,
    String? cover,
    required ESpecialization specialization,
  }) = _ChatInfo;

  factory ChatInfo.fromJson(
    Map<String, Object?> json,
  ) => _$ChatInfoFromJson(
    json,
  );
}
