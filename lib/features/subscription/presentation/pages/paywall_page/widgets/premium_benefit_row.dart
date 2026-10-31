import 'package:flutter/material.dart';

import '../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../core/widgets/wide/hover_card.dart';

class PremiumBenefitRow extends StatelessWidget {
  final String emoji;
  final String text;

  const PremiumBenefitRow({
    super.key,
    required this.emoji,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    final white = AppColors.white.value;

    return HoverCard(
      translucent: true,
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 14.0,
      ),
      child: Row(
        spacing: 14.0,
        children: [
          Container(
            width: 40.0,
            height: 40.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: white.withValues(
                alpha: 0.2,
              ),
            ),
            child: Text(
              emoji,
              style: textTheme.regular20,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: textTheme.medium15.copyWith(
                color: white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
