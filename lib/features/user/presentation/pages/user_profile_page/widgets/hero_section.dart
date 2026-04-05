import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/widgets/btn/custom_back_btn.dart';
import '../../../../../../core/widgets/build_image.dart';
import '../../../../../../../gen/assets.gen.dart';
import '../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../core/resources/colors/app_gradients.dart';
import '../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../core/utils/responsive_helper.dart';
import '../../../../../onboard_survey/domain/models/experiences/experiences.dart';
import '../../../../../onboard_survey/domain/models/specializations/specializations.dart';
import '../../../../domain/models/user_data/user_data.dart';
import 'online_badge.dart';
import 'skill_tag.dart';

class HeroSection extends StatelessWidget {
  final UserData userData;
  final double screenWidth;
  final AppTextTheme textTheme;
  final VoidCallback onBack;

  const HeroSection({
    super.key,
    required this.userData,
    required this.screenWidth,
    required this.textTheme,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    final heroHeight = ResponsiveHelper.responsiveSpacing(
      screenWidth,
      420.0,
      maxSpacing: 520,
    );
    final nameFontSize = ResponsiveHelper.responsiveFontSize(
      screenWidth,
      28.0,
      maxFontSize: 42,
    );
    final subtitleFontSize = ResponsiveHelper.responsiveFontSize(
      screenWidth,
      16.0,
      maxFontSize: 22,
    );
    final experienceFontSize = ResponsiveHelper.responsiveFontSize(
      screenWidth,
      14.0,
      maxFontSize: 18,
    );
    final skillFontSize = ResponsiveHelper.responsiveFontSize(
      screenWidth,
      13.0,
      maxFontSize: 16,
    );
    final heroPadding = ResponsiveHelper.responsivePadding(
      screenWidth,
      20.0,
      maxPadding: 32,
    );

    return SizedBox(
      height: heroHeight,
      child: Stack(
        children: [
          Positioned.fill(
            child: BuildImage(
              url: userData.avatarUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: AppGradients.blackToTransparent,
              ),
            ),
          ),
          Positioned(
            top: ResponsiveHelper.responsivePadding(
              screenWidth,
              12.0,
            ),
            left: ResponsiveHelper.responsivePadding(
              screenWidth,
              12.0,
            ),
            child: SafeArea(
              child: CustomBackBtn(
                onTap: onBack,
              ),
            ),
          ),
          Positioned(
            left: heroPadding,
            right: heroPadding,
            bottom: heroPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: ResponsiveHelper.responsiveSpacing(screenWidth, 10.0),
              children: [
                OnlineBadge(
                  isOnline: userData.isOnline,
                  screenWidth: screenWidth,
                  textTheme: textTheme,
                ),
                Text(
                  '${userData.firstName}, ${userData.age}',
                  style: textTheme.bold24.copyWith(
                    color: AppColors.white.value,
                    fontSize: nameFontSize,
                  ),
                ),
                Text(
                  Specializations.get(userData.profiler.specialization).name,
                  style: textTheme.medium16.copyWith(
                    color: AppColors.white.value.withValues(alpha: 0.9),
                    fontSize: subtitleFontSize,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: ResponsiveHelper.responsiveSpacing(screenWidth, 6.0),
                  children: [
                    SvgPicture.asset(
                      Assets.icons.time,
                      width: ResponsiveHelper.responsiveIconSize(
                        screenWidth,
                        16.0,
                        maxSize: 22,
                      ),
                      colorFilter: ColorFilter.mode(
                        AppColors.white.value.withValues(
                          alpha: 0.8,
                        ),
                        BlendMode.srcIn,
                      ),
                    ),
                    Text(
                      Experiences.get(
                        userData.profiler.experience,
                      ).rangeExperience,
                      style: textTheme.regular14.copyWith(
                        color: AppColors.white.value.withValues(
                          alpha: 0.85,
                        ),
                        fontSize: experienceFontSize,
                      ),
                    ),
                  ],
                ),
                if (userData.profiler.skills.isNotEmpty)
                  Wrap(
                    spacing: ResponsiveHelper.responsiveSpacing(
                      screenWidth,
                      8.0,
                    ),
                    runSpacing: ResponsiveHelper.responsiveSpacing(
                      screenWidth,
                      8.0,
                    ),
                    children: userData.profiler.skills
                        .map(
                          (skill) => SkillTag(
                            skillName: skill.name,
                            fontSize: skillFontSize,
                            screenWidth: screenWidth,
                            textTheme: textTheme,
                          ),
                        )
                        .toList(),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
