import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../../../../../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../../../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../../../../../../../../onboard_survey/domain/models/specialization/specialization.dart';

class SpecializationInfoBar extends StatelessWidget {
  final Specialization specialization;

  final bool includeIcon;

  const SpecializationInfoBar({
    super.key,
    required this.specialization,
    this.includeIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    return Container(
      // width: 160.0,
      padding: EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 10.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          17.5,
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: specialization.colors,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (includeIcon) ...[
            SvgPicture.asset(
              specialization.icon,
              width: 20.0,
              height: 20.0,
              colorFilter: ColorFilter.mode(
                AppColors.white.value,
                BlendMode.srcIn,
              ),
            ),
            Gap(10.0),
          ],
          Text(
            specialization.name,
            style: textTheme.medium16.copyWith(
              color: AppColors.white.value,
            ),
          ),
        ],
      ),
    );
  }
}

/*

 */
