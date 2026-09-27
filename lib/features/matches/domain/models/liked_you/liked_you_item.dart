import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../onboard_survey/domain/models/experience/experience.dart';
import '../../../../onboard_survey/domain/models/skill/skill.dart';
import '../../../../onboard_survey/domain/models/specialization/specialization.dart';

part 'liked_you_item.freezed.dart';

part 'liked_you_item.g.dart';

enum EImageState {
  clear,
  blurred,
  none,
}

@freezed
sealed class LikedYouItem with _$LikedYouItem {
  @JsonSerializable(anyMap: true)
  const factory LikedYouItem({
    required String likeId,
    required DateTime likedAt,
    required bool isLocked,
    @JsonKey(unknownEnumValue: EImageState.none)
    @Default(EImageState.none)
    EImageState imageState,
    String? imageUrl,
    String? uid,
    String? firstName,
    int? age,
    @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
    ESpecialization? specialization,
    @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
    EExperience? experience,
    @Default(<Skill>[]) List<Skill> skills,
    String? city,
    String? country,

    /// `null` when either side has no coordinates. A locked item MUST NOT
    /// carry a distance (`docs/liked_you_backend_contract.md` §5) — an
    /// exact distance plus a city would help identify a locked liker.
    double? distanceKm,
  }) = _LikedYouItem;

  factory LikedYouItem.fromJson(Map<String, dynamic> json) =>
      _$LikedYouItemFromJson(json);
}
