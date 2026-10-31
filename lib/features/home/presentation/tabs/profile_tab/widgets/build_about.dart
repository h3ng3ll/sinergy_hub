import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/resources/translations/app_localizations.dart';
import '../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../onboard_survey/domain/models/experiences/experiences.dart';
import '../../../../../user/domain/models/user_data/user_data.dart';
import 'build_user_title_widget.dart';
import 'shadow_container.dart';

class BuildAbout extends StatelessWidget {
  final VoidCallback onTapEdit;
  final VoidCallback onTapEditExperience;
  final UserData userData;

  const BuildAbout({
    super.key,
    required this.onTapEdit,
    required this.onTapEditExperience,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    final bio = userData.aboutMe?.trim() ?? '';
    final experience = Experiences.get(
      userData.profiler.experience,
    );
    return ShadowContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10.0,
        children: [
          BuildUserTitleWidget(
            onTapEdit: onTapEdit,
            title: AppLocalizations.of(context)!.about_me,
          ),
          if (bio.isNotEmpty)
            Text(
              bio,
              style: textTheme.regular16,
            ),
          InkWell(
            onTap: onTapEditExperience,
            child: Row(
              spacing: 10.0,
              children: [
                SvgPicture.asset(
                  experience.icon,
                  width: 20.0,
                  height: 20.0,
                ),
                Text(
                  experience.name,
                  style: textTheme.bold16,
                ),
                Expanded(
                  child: Text(
                    experience.rangeExperience,
                  ),
                ),
                Icon(
                  Icons.edit,
                  size: 20.0,
                  color: AppColors.black.value.withValues(
                    alpha: 0.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
