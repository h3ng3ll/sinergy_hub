import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../../core/widgets/padding/horizontal_padding.dart';
import '../../../../../../../gen/assets.gen.dart';
import '../../widgets/survey_card/build_icon.dart';
import '../../widgets/translucent_card_container.dart';

class ActiveCommunityOverlay extends StatelessWidget {
  final int countLookingPartners;
  final Offset offset;

  const ActiveCommunityOverlay({
    super.key,
    required this.countLookingPartners,
    required this.offset,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);
    return SafeArea(
      child: HorizontalPadding(
        child: Stack(
          children: [
            Positioned(
              // left: offset.dx ,
              right: 0,
              left: 0,
              top: offset.dy - 0,
              // alignment: Alignment.center,
              child: TranslucentCardContainer(
                // height: 40.0,
                child: Material(
                  color: Colors.transparent,
                  child: Row(
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      BuildIcon(
                        iconColor: colorScheme.onPrimary,
                        borderRadius: BorderRadius.circular(
                          50.0,
                        ),
                        padding: EdgeInsets.all(
                          5.0,
                        ),
                        colors: [
                          AppColors.buttonBlue.value,
                          AppColors.royalBlue.value,
                        ],
                        icon: Assets.icons.community,
                        width: 30.0,
                        height: 30.0,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Active Professionals',
                            style: textTheme.medium10.copyWith(
                              color: colorScheme.onPrimary,
                            ),
                          ),
                          Text(
                            ' $countLookingPartners members looking for partners',
                            style: textTheme.regular8.copyWith(
                              color: colorScheme.secondary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
