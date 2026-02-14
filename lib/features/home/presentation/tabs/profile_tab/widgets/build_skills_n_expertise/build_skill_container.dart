import 'package:flutter/material.dart';

import '../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../onboard_survey/domain/models/skill/skill.dart';

class BuildSkillContainer extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget child;

  const BuildSkillContainer({
    super.key,
    this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 7.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            17.5,
          ),
          color: AppColors.antiFlashWhite.value,
        ),
        child: child
      ),
    );
  }
}
