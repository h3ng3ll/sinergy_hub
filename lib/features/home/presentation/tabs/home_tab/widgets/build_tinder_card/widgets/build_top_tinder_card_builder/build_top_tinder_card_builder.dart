import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../../../gen/assets.gen.dart';
import '../../../../../../../../onboard_survey/doman/models/specialization/specialization.dart';
import 'widget/tinder_card_item/widgets/build_user_avatar.dart';

class BuildTopTinderCard extends StatelessWidget {
  final String? imgUrl;
  final double borderRadius;
  final Color colorOfSpecialization;
  final Specialization specialization;

  const BuildTopTinderCard({
    super.key,
    required this.imgUrl,
    required this.borderRadius,
    required this.colorOfSpecialization,
    required this.specialization,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            borderRadius,
          ),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            specialization.colors.first.withValues(
              alpha: 0.4,
            ),
            specialization.colors[1].withValues(
              alpha: 0.7,
            ),
          ],
        ),
        // color: AppColors.pinkLace.value,
      ),
      child: Stack(
        children: [
          Center(
            child: BuildUserAvatar(
              height: 120.0,
              width: 120.0,
              url: imgUrl,
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            // alignment: Alignment.bottomRight,
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colorOfSpecialization,
              ),
              padding: EdgeInsets.all(
                7.0,
              ),
              child: SvgPicture.asset(
                Assets.icons.check,
                colorFilter: ColorFilter.mode(
                  AppColors.white.value,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
