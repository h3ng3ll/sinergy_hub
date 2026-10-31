import 'package:flutter/material.dart';

import '../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../onboard_survey/domain/models/specializations/specializations.dart';
import '../../../../../../user/domain/models/user_data/user_data.dart';
import 'profile_avatar_ring.dart';
import 'profile_section_card.dart';

class ProfileIdentityCard extends StatelessWidget {
  final UserData userData;
  final VoidCallback onTapAvatar;

  const ProfileIdentityCard({
    super.key,
    required this.userData,
    required this.onTapAvatar,
  });

  String get _fullName => [
    userData.firstName,
    userData.lastName,
  ].map((e) => e?.trim() ?? '').where((e) => e.isNotEmpty).join(' ');

  String get _initials {
    final letters =
        [
              userData.firstName,
              userData.lastName,
            ]
            .map((e) => e?.trim() ?? '')
            .where((e) => e.isNotEmpty)
            .map(
              (e) => e[0].toUpperCase(),
            );
    return letters.isEmpty ? '?' : letters.join();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    final accent = AppColors.majorelleBlue.value;

    return ProfileSectionCard(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 28.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 14.0,
        children: [
          ProfileAvatarRing(
            url: userData.avatarUrl,
            initials: _initials,
            onTap: onTapAvatar,
          ),
          const SizedBox.shrink(),
          Text(
            _fullName,
            textAlign: TextAlign.center,
            style: textTheme.bold24.copyWith(
              color: AppColors.jacarta.value,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 14.0,
              vertical: 6.0,
            ),
            decoration: BoxDecoration(
              color: accent.withValues(
                alpha: 0.10,
              ),
              borderRadius: BorderRadius.circular(
                20.0,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 6.0,
              children: [
                Icon(
                  Icons.work_outline,
                  size: 16.0,
                  color: accent,
                ),
                Flexible(
                  child: Text(
                    Specializations.get(
                      userData.profiler.specialization,
                    ).name,
                    style: textTheme.medium14.copyWith(
                      color: accent,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
