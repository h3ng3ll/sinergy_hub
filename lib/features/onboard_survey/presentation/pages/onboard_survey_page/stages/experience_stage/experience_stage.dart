import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../../core/widgets/padding/horizontal_padding.dart';
import '../../../../../../../gen/assets.gen.dart';
import '../../../../../domain/models/experience/experience.dart';
import '../../widgets/build_onboard_bottom_actions.dart';
import '../../widgets/onboard_survey_header.dart';
import 'widgets/experience_card/experience_card.dart';

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
            child: GridView(
              padding: EdgeInsets.symmetric(
                vertical: 15.0,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 245.0,
                crossAxisSpacing: 15.0,
                mainAxisSpacing: 15.0,
              ),
              children: [
                ExperienceCard(
                  height: 245.0,
                  // height: 300,
                  // width: 300,
                  icon: Assets.icons.seedling,
                  isSelected: selectedExperience == EExperience.junior,
                  onTapCard: onSelectExperience,
                  experience: EExperience.junior,
                  name: 'Junior',
                  yearExperience: '0-2 years',
                  description:
                      'Learning and growing in your field. Ready to collaborate and gain experience.',
                ),

                ExperienceCard(
                  height: 245.0,
                  // height: 100,
                  // width: 100,
                  icon: Assets.icons.herb,
                  isSelected: selectedExperience == EExperience.middle,
                  onTapCard: onSelectExperience,
                  experience: EExperience.middle,
                  name: 'Middle',
                  yearExperience: '2-5 years',
                  description:
                      'Confident and independent professional with solid skills.',
                ),
                ExperienceCard(
                  height: 245.0,
                  icon: Assets.icons.tree,
                  isSelected: selectedExperience == EExperience.senior,
                  onTapCard: onSelectExperience,
                  experience: EExperience.senior,
                  name: 'Senior',
                  yearExperience: '5+ years',
                  description:
                      'Expert with deep knowledge and proven track record',
                ),
                ExperienceCard(
                  height: 245.0,
                  icon: Assets.icons.rocket,
                  isSelected: selectedExperience == EExperience.leadExpert,
                  onTapCard: onSelectExperience,
                  experience: EExperience.leadExpert,
                  name: 'Lead/Expert',
                  yearExperience: 'Leadership experience',
                  description:
                      'Team management and mentoring with strategic vision',
                ),
              ],
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
