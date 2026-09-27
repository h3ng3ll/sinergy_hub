import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/services/ui_message_service.dart';
import '../../../../onboard_survey/domain/models/experience/experience.dart';
import '../../../../onboard_survey/domain/models/skill/skill.dart';
import '../../../../onboard_survey/domain/models/specialization/specialization.dart';
import '../e_location_filter_mode.dart';

part 'matches_filter.g.dart';

part 'matches_filter.freezed.dart';

/// Default radius (km) applied when the user switches into Distance mode.
const int kDefaultLocationRadiusKm = 50;

extension MatchesFilterX on MatchesFilter {
  bool get isApplied =>
      skills.isNotEmpty ||
      experience != null ||
      specialization != null ||
      locationMode != null;

  bool get isPlaceMode => locationMode == ELocationFilterMode.place;

  bool get isRadiusMode => locationMode == ELocationFilterMode.radius;

  /// Switches to City mode, clearing any active radius. Passing an empty
  /// country/city keeps the mode active with no text yet.
  MatchesFilter setPlaceLocation({
    String? country,
    String? city,
  }) => copyWith(
    locationMode: ELocationFilterMode.place,
    country: country,
    city: city,
    radiusKm: null,
  );

  /// Switches to Distance mode, clearing any active City text.
  MatchesFilter setRadiusLocation([
    int radiusKm = kDefaultLocationRadiusKm,
  ]) => copyWith(
    locationMode: ELocationFilterMode.radius,
    radiusKm: radiusKm,
    country: null,
    city: null,
  );

  /// Turns location filtering off entirely.
  MatchesFilter clearLocation() => copyWith(
    locationMode: null,
    country: null,
    city: null,
    radiusKm: null,
  );

  bool isSelectedSkill(
    Skill skill,
  ) => skills.contains(
    skill,
  );

  MatchesFilter toggleSkill(Skill skill) {
    final newSkills = [...skills];
    if (skills.contains(skill)) {
      newSkills.add(
        skill,
      );
    } else {
      newSkills.remove(
        skill,
      );
    }
    return copyWith(
      skills: newSkills,
    );
  }

  bool get isExceeded => skills.length >= 10;

  MatchesFilter add(Skill skill) {
    final List<Skill> newSkills = [...skills];
    final isContain = skills
        .map((e) => e.name)
        .contains(
          skill.name,
        );

    if (isExceeded) {
      UiMessageService.showInfo(
        'Exceeded skills count .\nCancel operation',
      );
    }
    if (!isContain && !isExceeded) {
      newSkills.add(
        skill,
      );
    }

    return copyWith(
      skills: newSkills,
    );
  }

  MatchesFilter remove(Skill skill) {
    final newSkills = [...skills];
    newSkills.remove(
      skill,
    );

    return copyWith(
      skills: newSkills,
    );
  }
}

@freezed
sealed class MatchesFilter with _$MatchesFilter {
  const factory MatchesFilter({
    EExperience? experience,
    ESpecialization? specialization,
    @Default([]) List<Skill> skills,
    ELocationFilterMode? locationMode,
    String? country,
    String? city,
    int? radiusKm,
  }) = _MatchesFilter;

  factory MatchesFilter.fromJson(Map<String, Object?> json) =>
      _$MatchesFilterFromJson(json);
}
