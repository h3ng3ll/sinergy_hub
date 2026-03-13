import 'package:flutter/material.dart';

import '../../../../../../../core/resources/colors/app_gradients.dart';
import '../../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../onboard_survey/domain/models/skill/skill.dart';

/// Skills section widget with wrap layout of multi-selectable chips.
class SkillsSection extends StatelessWidget {
  final List<Skill> skills;
  final List<Skill> selectedSkills;
  final ValueChanged<Skill> onSkillToggled;

  const SkillsSection({
    super.key,
    required this.skills,
    required this.onSkillToggled,
    required this.selectedSkills,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Text(
            'Skills',
            style: textTheme.medium18.copyWith(
              color: const Color(0xff666666),
            ),
          ),
        ),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: skills.map((skill) {
            return _SkillChip(
              skill: skill,
              onTap: () => onSkillToggled(skill),
              isSelected: selectedSkills.contains(
                skill,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class _SkillChip extends StatelessWidget {
  final Skill skill;
  final bool isSelected;
  final VoidCallback onTap;

  const _SkillChip({
    required this.skill,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 16.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: isSelected ? null : const Color(0xfff5f5f5),
          gradient: isSelected ? AppGradients.bluePurple : null,
        ),
        child: Text(
          skill.name,
          style: textTheme.medium14.copyWith(
            color: isSelected ? Colors.white : const Color(0xff666666),
          ),
        ),
      ),
    );
  }
}
