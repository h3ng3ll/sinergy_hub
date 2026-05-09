import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../../core/widgets/build_user_avatar.dart';
import '../../../../../../../onboard_survey/domain/models/specialization/specialization.dart';

class BuildMatchAvatar extends StatelessWidget {
  final String? avatarUrl;
  final Specialization specialization;
  final double size;

  const BuildMatchAvatar({
    super.key,
    required this.avatarUrl,
    required this.specialization,
    this.size = 120.0,
  });

  @override
  Widget build(BuildContext context) {
    final borderWidth = (size * 0.035).clamp(2.0, 6.0);
    final badgeSize = (size * 0.30).clamp(28.0, 56.0);
    final badgeBorderWidth = (size * 0.025).clamp(2.0, 4.0);
    final badgeIconSize = badgeSize * 0.55;
    final badgeColor = specialization.colors.isNotEmpty
        ? specialization.colors.first
        : AppColors.buttonBlue.value;

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.white.value,
                width: borderWidth,
              ),
            ),
            child: ClipOval(
              child: BuildUserAvatar(
                width: size,
                height: size,
                url: avatarUrl,
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: badgeSize,
              height: badgeSize,
              decoration: BoxDecoration(
                color: badgeColor,
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.white.value,
                  width: badgeBorderWidth,
                ),
              ),
              child: Center(
                child: SvgPicture.asset(
                  specialization.icon,
                  width: badgeIconSize,
                  height: badgeIconSize,
                  colorFilter: ColorFilter.mode(
                    AppColors.white.value,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
