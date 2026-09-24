import 'package:flutter/material.dart';

import '../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../core/resources/text/app_text_theme.dart';

class PremiumBenefitRow extends StatelessWidget {
  final String text;

  const PremiumBenefitRow({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);

    return Row(
      spacing: 12.0,
      children: [
        Icon(
          Icons.check_circle_rounded,
          color: AppColors.majorelleBlue.value,
          size: 20.0,
        ),
        Expanded(
          child: Text(
            text,
            style: textTheme.regular14,
          ),
        ),
      ],
    );
  }
}
