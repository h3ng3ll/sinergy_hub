import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../../../../../gen/assets.gen.dart';

class BuildEmptyChatMessages extends StatelessWidget {
  const BuildEmptyChatMessages({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                color: AppColors.ghostWhite.value,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SvgPicture.asset(
                  Assets.icons.info,
                  width: 40.0,
                  height: 40.0,
                  colorFilter: ColorFilter.mode(
                    AppColors.lavenderFloral.value,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            const Gap(24.0),
            Text(
              // TODO: localize
              'No messages yet',
              style: textTheme.medium16.copyWith(
                color: AppColors.jacarta.value,
              ),
              textAlign: TextAlign.center,
            ),
            const Gap(8.0),
            Text(
              // TODO: localize
              'Type your first message below',
              style: textTheme.regular14.copyWith(
                color: AppColors.jacarta.value.withValues(alpha: 0.6),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
