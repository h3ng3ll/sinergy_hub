import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../../core/resources/translations/app_localizations.dart';
import '../../../../../../home/presentation/home_bottom_bar/widgets/build_animated_background/build_animated_background.dart';

class NoFoundLikedYou extends StatelessWidget {
  const NoFoundLikedYou({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(200.0),
            child: Container(
              width: 120.0,
              height: 120.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: BuildAnimatedBackground(
                child: Icon(
                  Icons.favorite_border,
                  color: AppColors.white.value,
                  size: 40.0,
                ),
              ),
            ),
          ),
          Gap(20.0),
          Text(
            l10n.liked_you_empty_title,
            style: textTheme.bold17,
          ),
        ],
      ),
    );
  }
}
