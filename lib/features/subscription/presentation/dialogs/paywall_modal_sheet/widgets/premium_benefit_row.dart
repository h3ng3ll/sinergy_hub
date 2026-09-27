import 'package:flutter/material.dart';

import '../../../../../../core/resources/text/app_text_theme.dart';

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

    return Row(
      spacing: 12.0,
      children: [
        SizedBox(
          width: 24.0,
          child: Text(
            emoji,
            textAlign: TextAlign.center,
            style: textTheme.regular16,
          ),
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
