import 'package:flutter/material.dart';

import '../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../onboard_survey/doman/models/skill/skill.dart';
import 'build_skill_container.dart';

class BuildSkillItem extends StatelessWidget {
  final Skill skill;
  final VoidCallback? onTap;

  const BuildSkillItem({
    super.key,
    required this.skill,
     this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BuildSkillContainer(
      onTap: onTap,
      child:  Text(
        skill.name,
      ),
    );
  }
}
