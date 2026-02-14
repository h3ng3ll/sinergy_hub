




import 'package:freezed_annotation/freezed_annotation.dart';

part 'experience.g.dart';

part 'experience.freezed.dart';

enum EExperience {
  junior,
  middle,
  senior,
  leadExpert
}


@freezed
sealed class Experience with _$Experience {
  const factory Experience({
    required String name,
    required EExperience experience,
    required String rangeExperience,
    required String description,
    @Default('') String icon,
  }) = _Experience;

  factory Experience.fromJson(Map<String, Object?> json) =>
      _$ExperienceFromJson(json);
}