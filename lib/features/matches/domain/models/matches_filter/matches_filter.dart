import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../onboard_survey/domain/models/experience/experience.dart';
import '../../../../onboard_survey/domain/models/skill/skill.dart';
import '../../../../onboard_survey/domain/models/specialization/specialization.dart';
import '../../../../user/domain/models/user_data/user_data.dart';
import '../../../presentation/bloc/tinder_card_cubit/tinder_card_cubit.dart';

part 'matches_filter.g.dart';

part 'matches_filter.freezed.dart';

extension MatchesFilterX on MatchesFilter {
  bool get isApplied =>
      skills.isNotEmpty || experience != null || specialization != null;

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
}

@freezed
sealed class MatchesFilter with _$MatchesFilter {
  const factory MatchesFilter({
    EExperience? experience,
    ESpecialization? specialization,
    @Default([]) List<Skill> skills,
  }) = _MatchesFilter;

  factory MatchesFilter.fromJson(Map<String, Object?> json) =>
      _$MatchesFilterFromJson(json);
}
