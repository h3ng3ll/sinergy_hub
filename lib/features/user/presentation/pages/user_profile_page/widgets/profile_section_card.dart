import 'package:flutter/material.dart';

import '../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../core/utils/responsive_helper.dart';
import '../../../../../../core/widgets/wide/hover_card.dart';
import '../../../../../onboard_survey/presentation/pages/onboard_survey_page/widgets/translucent_card_container.dart';

class ProfileSectionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget child;

  const ProfileSectionCard({
    super.key,
    required this.title,
    required this.icon,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    final white = AppColors.white.value;

    if (!ResponsiveHelper.isMobile(context)) {
      return HoverCard(
        translucent: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16.0,
          children: [
            Row(
              spacing: 12.0,
              children: [
                Container(
                  width: 36.0,
                  height: 36.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: white.withValues(
                      alpha: 0.2,
                    ),
                  ),
                  child: Icon(
                    icon,
                    size: 20.0,
                    color: white,
                  ),
                ),
                Expanded(
                  child: Text(
                    title,
                    style: textTheme.bold17.copyWith(
                      color: white,
                    ),
                  ),
                ),
              ],
            ),
            child,
          ],
        ),
      );
    }

    return TranslucentCardContainer(
      padding: const EdgeInsets.all(20.0),
      borderRadius: BorderRadius.circular(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 14.0,
        children: [
          Text(
            title,
            style: textTheme.bold17.copyWith(
              color: AppColors.white.value,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
