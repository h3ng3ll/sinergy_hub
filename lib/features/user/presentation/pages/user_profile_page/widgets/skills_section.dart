import 'package:flutter/material.dart';

import '../../../../../../core/resources/translations/app_localizations.dart';
import '../../../../../onboard_survey/domain/models/skill/skill.dart';
import 'profile_section_card.dart';
import 'skill_tag.dart';

class SkillsSection extends StatelessWidget {
  final List<Skill> skills;

  const SkillsSection({
    super.key,
    required this.skills,
  });

  @override
  Widget build(BuildContext context) {
    return ProfileSectionCard(
      title: AppLocalizations.of(context)!.edit_profile_skills,
      icon: Icons.auto_awesome_outlined,
      child: Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: skills
            .map(
              (skill) => SkillTag(
                skillName: skill.name,
              ),
            )
            .toList(),
      ),
    );
  }
}
