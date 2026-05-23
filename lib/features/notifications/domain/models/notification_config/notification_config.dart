import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../user/domain/models/user_data/user_data.dart';
import '../../../../matches/presentation/bloc/tinder_card_cubit/tinder_card_cubit.dart';

part 'notification_config.g.dart';

part 'notification_config.freezed.dart';

@freezed
sealed class NotificationConfig with _$NotificationConfig {
  const factory NotificationConfig({
    @Default(<String, String>{}) Map<String, String> fcmTokens,
    @Default(true) bool enabledNotifications,
  }) = _NotificationConfig;

  factory NotificationConfig.fromJson(Map<String, Object?> json) =>
      _$NotificationConfigFromJson(json);
}
