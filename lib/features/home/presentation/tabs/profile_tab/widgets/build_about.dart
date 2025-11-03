import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../onboard_survey/doman/models/experiences/experiences.dart';
import '../../../../../user/domain/models/user_data/user_data.dart';
import 'build_user_title_widget.dart';
import 'shadow_container.dart';

class BuildAbout extends StatelessWidget {
  final VoidCallback onTapEdit;
  final UserData userData;

  const BuildAbout({
    super.key,
    required this.onTapEdit,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);
    final experience = Experiences.get(
      userData.profiler.experience,
    );
    return ShadowContainer(
      child: Column(
        children: [
          BuildUserTitleWidget(
            onTapEdit: onTapEdit,
            title: 'About',
          ),
          Text(
            userData.aboutMe.toString(),
            style: textTheme.regular16,
          ),
          Row(
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
              Text(
                experience.rangeExperience,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
