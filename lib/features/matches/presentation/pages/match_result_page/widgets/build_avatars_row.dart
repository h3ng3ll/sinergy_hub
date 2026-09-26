import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/utils/responsive_helper.dart';
import '../../../../../onboard_survey/domain/models/specialization/specialization.dart';
import '../../../../../onboard_survey/domain/models/specializations/specializations.dart';
import '../../../../../user/domain/models/user_data/user_data.dart';
import '../../discovery_page/widgets/build_has_match/widgets/build_match_avatar.dart';
import 'build_heart.dart';

class BuildAvatarsRow extends StatelessWidget {
  final double screenWidth;
  final UserData matchedUser;
  final UserData? currentUser;

  const BuildAvatarsRow({
    super.key,
    required this.screenWidth,
    required this.matchedUser,
    this.currentUser,
  });

  @override
  Widget build(BuildContext context) {
    final avatarSize = ResponsiveHelper.responsiveAvatarSize(
      screenWidth,
      110.0,
      maxSize: 160,
    );
    final heartSize = ResponsiveHelper.responsiveIconSize(
      screenWidth,
      56.0,
      maxSize: 80,
    );
    final heartIconSize = ResponsiveHelper.responsiveIconSize(
      screenWidth,
      32.0,
      maxSize: 48,
    );
    final stackGap = ResponsiveHelper.responsiveSpacing(
      screenWidth,
      100.0,
      maxSpacing: 140,
    );

    final Specialization matchedSpecialization = Specializations.get(
      matchedUser.profiler.specialization,
    );
    final Specialization? currentSpecialization = currentUser != null
        ? Specializations.get(currentUser!.profiler.specialization)
        : null;

    final isMobile = ResponsiveHelper.isMobile(
      context,
    );
    if (isMobile) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        spacing: 5.0,
        children: [
          Flexible(
            child: BuildMatchAvatar(
              avatarUrl: matchedUser.avatarUrl,
              specialization: matchedSpecialization,
              size: avatarSize,
            ),
          ),
          BuildHeart(
            heartSize: heartSize,
            heartIconSize: heartIconSize,
          ),
          if (currentSpecialization != null)
            Flexible(
              child: BuildMatchAvatar(
                avatarUrl: currentUser?.avatarUrl,
                specialization: currentSpecialization,
                size: avatarSize,
              ),
            ),
        ],
      );
    }
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            BuildMatchAvatar(
              avatarUrl: matchedUser.avatarUrl,
              specialization: matchedSpecialization,
              size: avatarSize,
            ),
            Gap(stackGap),
            if (currentSpecialization != null)
              BuildMatchAvatar(
                avatarUrl: currentUser?.avatarUrl,
                specialization: currentSpecialization,
                size: avatarSize,
              ),
          ],
        ),
        // Heart Icon in the middle
        Positioned(
          child: BuildHeart(
            heartSize: heartSize,
            heartIconSize: heartIconSize,
          ),
        ),
      ],
    );
  }
}
