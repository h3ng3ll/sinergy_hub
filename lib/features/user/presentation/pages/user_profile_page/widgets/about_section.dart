import 'package:flutter/material.dart';

import '../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../core/resources/text/app_text_theme.dart';
import 'profile_section_card.dart';

class AboutSection extends StatelessWidget {
  final String aboutMe;

  const AboutSection({
    super.key,
    required this.aboutMe,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);

    return ProfileSectionCard(
      title: 'About',
      child: Text(
        aboutMe,
        style: textTheme.regular16.copyWith(
          color: AppColors.white.value.withValues(alpha: 0.95),
          height: 1.5,
        ),
      ),
    );
  }
}
