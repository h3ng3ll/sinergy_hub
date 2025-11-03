import 'package:freezed_annotation/freezed_annotation.dart';

part 'skill.g.dart';

part 'skill.freezed.dart';

enum ESkill {
  javaScript,
  react,
  nodeJs,
  python,
  mongoDB,
  aws,
  docker,
  graphql,
  typescript,
  postgresql,
  redis,
  kubernetes,
  firebase,
  stripe,
  figma,
  jira,
  git,
}

@freezed
sealed class Skill with _$Skill {
  const factory Skill({
    required String name,
    // required ESkill specialization,
  }) = _Skill;

  factory Skill.fromJson(Map<String, Object?> json) => _$SkillFromJson(json);
}
