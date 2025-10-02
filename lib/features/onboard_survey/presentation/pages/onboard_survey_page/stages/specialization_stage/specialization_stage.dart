import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../../gen/assets.gen.dart';
import '../../../../../doman/models/role/role.dart';
import '../../widgets/survey_card/survey_card.dart';

class SpecializationStage extends StatelessWidget {
  final Function(ERole) onTap;
  final ERole? selectedRole;
  final Function(RenderBox) onLongPress;

  const SpecializationStage({
    super.key,
    required this.onTap,
    required this.selectedRole,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);

    return Column(
      children: [
        Text(
          'What is your primary role?',
          style: textTheme.bold24.copyWith(
            color: colorScheme.onPrimary,
          ),
        ),
        Gap(15.0),

        Text(
          'Help us understand your professional expertise',
          style: textTheme.regular14.copyWith(
            color: colorScheme.secondary,
          ),
        ),
        Gap(15.0),
        Column(
          spacing: 15.0,
          children: [
            SurveyCard(
              isSelected: selectedRole == ERole.technicalDevelopment,
              colors: [
                AppColors.buttonBlue.value,
                AppColors.royalBlue.value,
              ],
              icon: Assets.icons.tool,
              title: 'Technical/Development',
              description:
                  'Software development , engineering, and technical architecture',
              onTap: () => onTap(
                ERole.technicalDevelopment,
              ),
              onLongPress: onLongPress,
            ),
            SurveyCard(
              isSelected: selectedRole == ERole.productManager,
              colors: [
                AppColors.lavenderFloral.value.withValues(
                  // alpha: 0.3,
                ),
                AppColors.darkOrchid.value,
              ],
              icon: Assets.icons.work,
              title: 'Product Management',
              description:
                  'Product strategy , roadmap planning and market analysis',
              onTap: () => onTap(
                ERole.productManager,
              ),
              onLongPress: onLongPress,
            ),
            SurveyCard(
              isSelected: selectedRole == ERole.design,
              colors: [
                AppColors.hotPink.value,
                AppColors.telemagenta.value,
              ],
              icon: Assets.icons.pallete,
              title: 'Design',
              description: 'UI/UX design , visual design , and user experience',
              onTap: () => onTap(
                ERole.design,
              ),
              onLongPress: onLongPress,
            ),
            SurveyCard(
              isSelected: selectedRole == ERole.businessMarketing,
              colors: [
                AppColors.uFOGreen.value,
                AppColors.seaGreen.value,
              ],
              icon: Assets.icons.analytic,
              title: 'Business/Marketing',
              description:
                  'Growth strategy,sales , marketing, and business development',
              onTap: () => onTap(
                ERole.businessMarketing,
              ),
              onLongPress: onLongPress,
            ),
            SurveyCard(
              isSelected: selectedRole == ERole.other,
              colors: [
                AppColors.metallicOrange.value,
                AppColors.jasperOrange.value,
              ],
              icon: Assets.icons.rocket,
              title: 'Other',
              description:
                  'Entrepreneurship , leadership , consulting , and specialized roles',
              onTap: () => onTap(
                ERole.other,
              ),
              onLongPress: onLongPress,
            ),
          ],
        ),
      ],
    );
  }
}
