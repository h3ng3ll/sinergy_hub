import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../user/domain/models/user_data/user_data.dart';
import '../../../../matches/presentation/bloc/tinder_card_cubit/tinder_card_cubit.dart';

part 'notification.g.dart';

part 'notification.freezed.dart';

@freezed
sealed class Notification with _$Notification {
  const factory Notification({
    @Default('') String id,
    @Default('') String uid,
    @Default('') String deviceToken,
    @Default('') String title,
    @Default('') String description,
    @Default(false) bool hasRead,
    required DateTime createdAt,
  }) = _Notification;

  factory Notification.fromJson(Map<String, Object?> json) =>
      _$NotificationFromJson(json);
}
