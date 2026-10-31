import 'package:flutter/material.dart';

import '../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../core/utils/initials.dart';
import '../../../../../../core/utils/responsive_helper.dart';
import '../../../../../../core/widgets/build_image.dart';
import '../../../../../../core/widgets/wide/avatar_ring.dart';
import '../../../../domain/models/user_data/user_data.dart';
import 'experience_chip.dart';
import 'online_badge.dart';
import 'specialization_pill.dart';

class HeroSection extends StatelessWidget {
  final UserData userData;

  const HeroSection({
    super.key,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    final firstName = userData.firstName ?? '';
    final name = userData.age == null
        ? firstName
        : '$firstName, ${userData.age}';
    final statusColor = userData.isOnline
        ? AppColors.greenCrayola.value
        : AppColors.heartRed.value;

    return Column(
      spacing: 14.0,
      children: [
        if (!ResponsiveHelper.isMobile(context))
          AvatarRing(
            url: userData.avatarUrl,
            initials: initialsOf([userData.firstName, userData.lastName]),
            showEditBadge: false,
            statusOnline: userData.isOnline,
          )
        else
          SizedBox.square(
            dimension: 132.0,
            child: Stack(
              children: [
                BuildImage(
                  url: userData.avatarUrl,
                  width: 132.0,
                  height: 132.0,
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 3.0,
                    color: AppColors.white.value.withValues(alpha: 0.85),
                  ),
                ),
                Positioned(
                  right: 8.0,
                  bottom: 8.0,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: statusColor,
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 3.0,
                        color: AppColors.white.value,
                      ),
                    ),
                    child: const SizedBox.square(
                      dimension: 22.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        Column(
          spacing: 6.0,
          children: [
            Text(
              name,
              textAlign: TextAlign.center,
              style: textTheme.bold26.copyWith(
                color: AppColors.white.value,
              ),
            ),
            OnlineBadge(
              isOnline: userData.isOnline,
            ),
          ],
        ),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 10.0,
          runSpacing: 10.0,
          children: [
            SpecializationPill(
              specialization: userData.profiler.specialization,
              isLarge: true,
            ),
            ExperienceChip(
              experience: userData.profiler.experience,
            ),
          ],
        ),
      ],
    );
  }
}
