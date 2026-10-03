import 'package:flutter/material.dart';

import '../../../../../../../../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../../../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../../../../../../../../onboard_survey/domain/models/specialization/specialization.dart';

class MoreInfoBtn extends StatelessWidget {
  final Specialization specialization;
  final VoidCallback onTap;

  const MoreInfoBtn({
    super.key,
    required this.specialization,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);

    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          gradient: LinearGradient(
            colors: specialization.colors,
          ),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 6.0,
              children: [
                Text(
                  'More info',
                  style: textTheme.medium14.copyWith(
                    color: AppColors.white.value,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_rounded,
                  size: 18.0,
                  color: AppColors.white.value,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
