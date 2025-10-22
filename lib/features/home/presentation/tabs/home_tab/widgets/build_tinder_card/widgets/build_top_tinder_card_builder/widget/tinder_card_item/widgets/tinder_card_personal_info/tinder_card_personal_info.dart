import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../../../../../../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../../../../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../../../../../../../../core/widgets/btn/custom_chip.dart';
import '../../../../../../../../../../../../onboard_survey/doman/models/experiences/experiences.dart';
import '../../../../../../../../../../../../onboard_survey/doman/models/specialization/specialization.dart';
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
    print(experience.icon);
    return Column(
      spacing: 10.0,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              user.firstName ?? '',
              style: textTheme.bold20,
            ),
            Gap(5.0),
            Text(
              user.lastName ?? '',
              style: textTheme.bold20,
            ),
          ],
        ),
        Text(
          user.age?.toString() ?? '',
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
        Gap(10.0),
        Text(
          'LOOKING FOR:'.toUpperCase(),
          style: textTheme.regular16,
        ),
        BuildSpecializationNames(
          searchingSpecializations: user.profiler.searchingSpecializations,
        ),
      ],
    );
  }
}
