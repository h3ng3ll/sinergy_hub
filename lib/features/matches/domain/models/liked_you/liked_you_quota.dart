import 'package:freezed_annotation/freezed_annotation.dart';

part 'liked_you_quota.freezed.dart';

part 'liked_you_quota.g.dart';

enum ELikedYouQuotaPeriod {
  daily,
  weekly,
}

@freezed
sealed class LikedYouQuota with _$LikedYouQuota {
  @JsonSerializable(anyMap: true)
  const factory LikedYouQuota({
    @JsonKey(unknownEnumValue: ELikedYouQuotaPeriod.weekly)
    @Default(ELikedYouQuotaPeriod.weekly)
    ELikedYouQuotaPeriod period,
    @Default(0) int limit,
    @Default(0) int used,
    @Default(0) int remaining,
    DateTime? resetsAt,
    @Default(false) bool isUnlimited,
  }) = _LikedYouQuota;

  factory LikedYouQuota.fromJson(Map<String, dynamic> json) =>
      _$LikedYouQuotaFromJson(json);
}
