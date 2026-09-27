import 'package:flutter/material.dart';

import '../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../core/resources/colors/app_gradients.dart';
import '../../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../../core/resources/translations/app_localizations.dart';
import '../../../../../../../core/widgets/btn/custom_chip.dart';
import '../../../../../../../core/widgets/build_image.dart';
import '../../../../../../onboard_survey/domain/models/experiences/experiences.dart';
import '../../../../../../onboard_survey/domain/models/specializations/specializations.dart';
import '../../../../../domain/models/liked_you/liked_you_item.dart';
import '../liked_you_actions/liked_you_actions.dart';
import '../locked_overlay/locked_overlay.dart';

/// Cards show at most this many skill chips — the server already caps the
/// list at 3, but the client caps its own display too (defensive parsing
/// per the backend contract §5).
const int _kMaxDisplayedSkills = 3;

const double _kCardHeight = 420.0;
const double _kCardBorderRadius = 20.0;

class LikedYouCard extends StatelessWidget {
  final LikedYouItem item;
  final VoidCallback? onTapLocked;
  final VoidCallback? onLike;
  final VoidCallback? onReject;
  final bool isResponding;

  const LikedYouCard({
    super.key,
    required this.item,
    this.onTapLocked,
    this.onLike,
    this.onReject,
    this.isResponding = false,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final borderRadius = BorderRadius.circular(_kCardBorderRadius);
    final nameLine = _nameLine(item);
    final subtitleLine = _subtitleLine(item);
    final skills = item.skills.take(_kMaxDisplayedSkills).toList();
    final hasActions = onLike != null && onReject != null;

    return GestureDetector(
      onTap: onTapLocked?.call,
      child: SizedBox(
        width: double.infinity,
        height: _kCardHeight,
        child: ClipRRect(
          borderRadius: borderRadius,
          child: Stack(
            fit: StackFit.expand,
            children: [
              BuildImage(
                url: item.imageUrl,
                fit: BoxFit.cover,
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: AppGradients.blackToTransparent,
                ),
              ),
              Positioned(
                left: 16.0,
                right: hasActions ? 148.0 : 16.0,
                bottom: 16.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  spacing: 8.0,
                  children: [
                    if (nameLine != null)
                      Text(
                        nameLine,
                        style: textTheme.bold20.copyWith(
                          color: AppColors.white.value,
                        ),
                      ),
                    if (subtitleLine != null)
                      Text(
                        subtitleLine,
                        style: textTheme.regular14.copyWith(
                          color: AppColors.white.value,
                        ),
                      ),
                    if (skills.isNotEmpty)
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: [
                          for (final skill in skills)
                            CustomChip(
                              selected: false,
                              onTap: null,
                              label: Text(
                                skill.name,
                                style: textTheme.regular12.copyWith(
                                  color: AppColors.white.value,
                                ),
                              ),
                            ),
                        ],
                      ),
                    Text(
                      _agoLine(l10n, item.likedAt),
                      style: textTheme.regular12.copyWith(
                        color: AppColors.greyLight.value,
                      ),
                    ),
                  ],
                ),
              ),
              if (hasActions)
                Positioned(
                  right: 16.0,
                  bottom: 16.0,
                  child: LikedYouActions(
                    onLike: isResponding ? null : onLike,
                    onReject: isResponding ? null : onReject,
                  ),
                ),
              if (item.isLocked) const LockedOverlay(),
            ],
          ),
        ),
      ),
    );
  }
}

String? _nameLine(LikedYouItem item) {
  final name = item.firstName;
  final age = item.age;
  if (name == null && age == null) return null;
  if (name == null) return '$age';
  if (age == null) return name;
  return '$name, $age';
}

String? _subtitleLine(LikedYouItem item) {
  final specialization = item.specialization;
  final experience = item.experience;
  final specializationName = specialization != null
      ? Specializations.get(specialization).name
      : null;
  final experienceName = experience != null
      ? Experiences.experiences[experience]?.name
      : null;
  if (specializationName == null && experienceName == null) return null;
  if (specializationName == null) return experienceName;
  if (experienceName == null) return specializationName;
  return '$specializationName · $experienceName';
}

String _agoLine(AppLocalizations l10n, DateTime likedAt) {
  final diff = DateTime.now().difference(likedAt);
  if (diff.inMinutes < 1) return l10n.liked_you_just_now;
  final String time;
  if (diff.inDays >= 1) {
    time = '${diff.inDays}d';
  } else if (diff.inHours >= 1) {
    time = '${diff.inHours}h';
  } else {
    time = '${diff.inMinutes}m';
  }
  return l10n.liked_you_ago(time);
}
