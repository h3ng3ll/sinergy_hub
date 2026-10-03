import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../../core/widgets/padding/horizontal_padding.dart';
import '../../../../../domain/models/experience/experience.dart';
import '../../widgets/build_onboard_bottom_actions.dart';
import '../../widgets/onboard_survey_header.dart';
import 'widgets/experience_grid.dart';

class ExperienceStage extends StatelessWidget {
  final Function(EExperience) onSelectExperience;
  final EExperience? selectedExperience;
  final VoidCallback? onTapContinue;
  final VoidCallback skipForNow;

  const ExperienceStage({
    super.key,
    required this.onSelectExperience,
    required this.selectedExperience,
    this.onTapContinue,
    required this.skipForNow,
  });

  @override
  Widget build(BuildContext context) {
    return HorizontalPadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: OnboardSurveyHeader(
              title: 'What is your experience level?',
              description: 'Help us find your perfect co-founder match',
            ),
          ),
          Gap(20.0),
          Expanded(
            child: ExperienceGrid(
              selectedExperience: selectedExperience,
              onSelectExperience: onSelectExperience,
            ),
          ),
          BuildOnboardBottomActions(
            skipForNow: skipForNow,
            onPressed: onTapContinue,
          ),
        ],
      ),
    );
  }
}
