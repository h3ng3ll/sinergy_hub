import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../../../../../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../../../../../../../../core/widgets/padding/horizontal_padding.dart';
import '../../../../../../../../../../../../onboard_survey/domain/models/experiences/experiences.dart';
import '../../../../../../../../../../../../onboard_survey/domain/models/specialization/specialization.dart';
import '../../../../../../../../../../../../user/domain/models/user_data/user_data.dart';
import 'widgets/build_specialization_names.dart';
import 'widgets/specialization_info_bar.dart';

class TinderCardPersonalInfo extends StatelessWidget {
  final UserData user;
  final Specialization specialization;

  const TinderCardPersonalInfo({
    super.key,
    required this.user,
    required this.specialization,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    final experience = Experiences.get(
      user.profiler.experience,
    );
    return Column(
      spacing: 10.0,
      children: [
        Gap(5.0),
        AutoSizeText(
          '${user.firstName ?? ''} ${user.lastName ?? ''} ',
          style: textTheme.bold20,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),

        Text(
          user.age?.toString() ?? 'unknown age',
          style: textTheme.regular16,
        ),
        SpecializationInfoBar(
          specialization: specialization,
        ),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 10.0,
          children: [
            SvgPicture.asset(
              experience.icon,
              width: 20.0,
              height: 20.0,
            ),

            Text(
              experience.name,
              style: textTheme.regular16,
            ),
            Text(
              experience.rangeExperience,
              style: textTheme.regular16,
            ),
          ],
        ),

        Expanded(
          child: HorizontalPadding(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'LOOKING FOR:'.toUpperCase(),
                  style: textTheme.regular12,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Padding(
                  padding: EdgeInsetsGeometry.all(
                    5.0,
                  ),
                  child: BuildSpecializationNames(
                    searchingSpecializations:
                        user.profiler.searchingSpecializations,
                  ),
                ),
                Text(
                  'About Me:',
                  style: textTheme.regular12,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Expanded(
                  child: Text(
                    user.aboutMe?.toString() ??
                        'No info . Know about user more by matched it',
                    style: textTheme.regular16,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),

      ],
    );
  }
}
