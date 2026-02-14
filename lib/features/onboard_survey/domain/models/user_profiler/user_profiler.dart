import 'package:freezed_annotation/freezed_annotation.dart';

import '../experience/experience.dart';
import '../role/role.dart';
import '../skill/skill.dart';
import '../specialization/specialization.dart';

part 'user_profiler.g.dart';

part 'user_profiler.freezed.dart';

@freezed
sealed class UserProfiler with _$UserProfiler {
  const factory UserProfiler({
    required ESpecialization specialization,
    required ERole role,
    required EExperience experience,
    required List<ESpecialization> searchingSpecializations,
    @Default([]) List<Skill> skills,
  }) = _UserProfiler;

  factory UserProfiler.fromJson(Map<String, dynamic> json) =>
      _$UserProfilerFromJson(json);
}
