import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../../../gen/assets.gen.dart';

class BuildChatsEmpty extends StatelessWidget {
  const BuildChatsEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    final colorScheme = AppColorScheme.of(context);

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
                color: AppColors.white.value.withValues(
                  alpha: 0.2,
                ),
                borderRadius: BorderRadius.circular(
                  12.0,
                ),
              ),
              child: Center(
                child: SvgPicture.asset(
                  Assets.icons.user,
                  width: 40.0,
                  height: 40.0,
                  colorFilter: ColorFilter.mode(
                    colorScheme.onPrimary.withValues(
                      alpha: 0.6,
                    ),
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            const Gap(16.0),
            Text(
              // TODO: localize
              'No chats yet',
              style: textTheme.bold16.copyWith(
                color: colorScheme.onPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            const Gap(8.0),
            Text(
              // TODO: localize
              'Start connecting with others',
              style: textTheme.regular12.copyWith(
                color: colorScheme.onPrimary.withValues(
                  alpha: 0.6,
                ),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
