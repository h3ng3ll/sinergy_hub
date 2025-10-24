import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../../../../../../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../../../onboard_survey/doman/models/specialization/specialization.dart';

class SpecializationContainer extends StatelessWidget {
  final Specialization specialization;

  const SpecializationContainer({
    super.key,
    required this.specialization,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    final colorScheme = AppColorScheme.of(context);

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
          alpha: 0.4,
        ),
      ),
      child: Text(
        specialization.name,
        style: textTheme.medium14.copyWith(
          color: colorScheme.onPrimary,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
