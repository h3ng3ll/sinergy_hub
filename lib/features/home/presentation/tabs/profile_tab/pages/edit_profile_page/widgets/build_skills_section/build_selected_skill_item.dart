import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../../onboard_survey/doman/models/skill/skill.dart';
import '../../../../widgets/build_skills_n_expertise/build_skill_container.dart';

class BuildSelectedSkillItem extends StatelessWidget {
  final Skill skill;
  final VoidCallback onTap;

  const BuildSelectedSkillItem({
    super.key,
    required this.skill,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BuildSkillContainer(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            skill.name,
          ),
          Gap(10.0),
          Icon(
            Icons.close,
            size: 15.0,
          ),
        ],
      ),
    );
  }
}
