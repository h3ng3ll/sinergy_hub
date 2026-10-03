import 'package:flutter/material.dart';

import '../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../onboard_survey/presentation/pages/onboard_survey_page/widgets/translucent_card_container.dart';

class ProfileSectionCard extends StatelessWidget {
  final String title;
  final Widget child;

  const ProfileSectionCard({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);

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
