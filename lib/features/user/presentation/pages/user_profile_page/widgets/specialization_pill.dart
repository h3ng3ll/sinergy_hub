import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../onboard_survey/domain/models/specialization/specialization.dart';
import '../../../../../onboard_survey/domain/models/specializations/specializations.dart';

class SpecializationPill extends StatelessWidget {
  final ESpecialization specialization;
  final bool isLarge;

  const SpecializationPill({
    super.key,
    required this.specialization,
    this.isLarge = false,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    final spec = Specializations.get(specialization);
    final iconSize = isLarge ? 18.0 : 16.0;

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22.0),
        gradient: LinearGradient(
          colors: spec.colors.length > 1
              ? spec.colors
              : [AppColors.majorelleBlue.value, AppColors.darkOrchid.value],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isLarge ? 16.0 : 14.0,
          vertical: isLarge ? 9.0 : 8.0,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 8.0,
          children: [
            SvgPicture.asset(
              spec.icon,
              width: iconSize,
              height: iconSize,
              colorFilter: ColorFilter.mode(
                AppColors.white.value,
                BlendMode.srcIn,
              ),
            ),
            Flexible(
              child: Text(
                spec.name,
                overflow: TextOverflow.ellipsis,
                style: (isLarge ? textTheme.medium15 : textTheme.medium14)
                    .copyWith(
                      color: AppColors.white.value,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
