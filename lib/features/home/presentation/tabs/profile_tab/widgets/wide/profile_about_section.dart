import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../core/resources/translations/app_localizations.dart';
import '../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../onboard_survey/domain/models/experiences/experiences.dart';
import '../../../../../../user/domain/models/user_data/user_data.dart';
import '../../../../../../../core/widgets/wide/hover_card.dart';
import 'profile_section_header.dart';

class ProfileAboutSection extends StatelessWidget {
  final UserData userData;
  final VoidCallback onTapEdit;
  final VoidCallback onTapEditExperience;

  const ProfileAboutSection({
    super.key,
    required this.userData,
    required this.onTapEdit,
    required this.onTapEditExperience,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    final bio = userData.aboutMe?.trim() ?? '';
    final experience = Experiences.get(
      userData.profiler.experience,
    );
    final muted = AppColors.darkBlueGray.value;

    return HoverCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 16.0,
        children: [
          ProfileSectionHeader(
            icon: Icons.person_outline,
            title: AppLocalizations.of(context)!.about_me,
            onTapEdit: onTapEdit,
          ),
          if (bio.isNotEmpty)
            Text(
              bio,
              style: textTheme.regular16.copyWith(
                color: AppColors.jacarta.value,
                height: 1.5,
              ),
            )
          else
            InkWell(
              onTap: onTapEdit,
              borderRadius: BorderRadius.circular(
                8.0,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 4.0,
                ),
                child: Text(
                  AppLocalizations.of(context)!.profile_bio_empty_prompt,
                  style: textTheme.regular16.copyWith(
                    color: muted,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
          Material(
            color: AppColors.majorelleBlue.value.withValues(
              alpha: 0.06,
            ),
            borderRadius: BorderRadius.circular(
              16.0,
            ),
            child: InkWell(
              onTap: onTapEditExperience,
              borderRadius: BorderRadius.circular(
                16.0,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14.0,
                  vertical: 12.0,
                ),
                child: Row(
                  spacing: 12.0,
                  children: [
                    SvgPicture.asset(
                      experience.icon,
                      width: 28.0,
                      height: 28.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 2.0,
                        children: [
                          Text(
                            experience.name,
                            style: textTheme.bold16.copyWith(
                              color: AppColors.jacarta.value,
                            ),
                          ),
                          Text(
                            experience.rangeExperience,
                            style: textTheme.regular14.copyWith(
                              color: muted,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: muted,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
