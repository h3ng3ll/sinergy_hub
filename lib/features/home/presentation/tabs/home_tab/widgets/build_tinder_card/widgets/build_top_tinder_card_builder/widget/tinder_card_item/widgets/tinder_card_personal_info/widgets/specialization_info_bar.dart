import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../../../../../../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../../../../../../../../onboard_survey/doman/models/specialization/specialization.dart';

class SpecializationInfoBar extends StatelessWidget {
  final Specialization specialization;

  const SpecializationInfoBar({
    super.key,
    required this.specialization,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    return Container(
      // width: 160.0,
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 15.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          17.5,
        ),
        color: specialization.colors[1].withValues(
          alpha: 0.2,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            specialization.icon,
            width: 20.0,
            height: 20.0,
            colorFilter: ColorFilter.mode(
              specialization.colors[1],
              BlendMode.srcIn,
            ),
          ),
          Gap(10.0),
          Text(
            specialization.name,
            style: textTheme.medium16.copyWith(
              color: specialization.colors[1],
            ),
          ),
        ],
      ),
    );
  }
}

/*

 */
