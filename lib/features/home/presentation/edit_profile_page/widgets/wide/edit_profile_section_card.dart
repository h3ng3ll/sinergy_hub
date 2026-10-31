import 'package:flutter/material.dart';

import '../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../onboard_survey/presentation/pages/onboard_survey_page/widgets/translucent_card_container.dart';

/// Glass card with an icon + title header, for form sections on the
/// gradient (the inputs are translucent, so a white card would clash).
class EditProfileSectionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget child;

  const EditProfileSectionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    final white = AppColors.white.value;

    return TranslucentCardContainer(
      borderRadius: BorderRadius.circular(
        24.0,
      ),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
}
