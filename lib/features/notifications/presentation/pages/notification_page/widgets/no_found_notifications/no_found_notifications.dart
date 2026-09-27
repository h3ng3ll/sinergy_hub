import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../../core/resources/translations/app_localizations.dart';
import '../../../../../../home/presentation/home_bottom_bar/widgets/build_animated_background/build_animated_background.dart';

/// One full back-and-forth swing of the bell.
const Duration _kSwingDuration = Duration(milliseconds: 1600);

/// Peak swing angle, in radians (~12°).
const double _kSwingAngle = math.pi / 15;

class NoFoundNotifications extends StatefulWidget {
  const NoFoundNotifications({super.key});

  @override
  State<NoFoundNotifications> createState() => _NoFoundNotificationsState();
}

class _NoFoundNotificationsState extends State<NoFoundNotifications>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: _kSwingDuration,
    )..repeat(
        reverse: true,
      );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                    200.0,
                  ),
                  child: SizedBox(
                    width: 120.0,
                    height: 120.0,
                    child: BuildAnimatedBackground(
                      child: AnimatedBuilder(
                        animation: _animation,
                        builder: (context, child) => Transform.rotate(
                          angle: _kSwingAngle * (2 * _animation.value - 1),
                          alignment: Alignment.topCenter,
                          child: child,
                        ),
                        child: Icon(
                          Icons.notifications_rounded,
                          color: AppColors.white.value,
                          size: 48.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: -6.0,
                  bottom: -2.0,
                  child: Text(
                    '😴',
                    style: textTheme.regular20.copyWith(
                      fontSize: 34.0,
                    ),
                  ),
                ),
              ],
            ),
            Gap(28.0),
            Text(
              l10n.notifications_empty_title,
              textAlign: TextAlign.center,
              style: textTheme.bold22,
            ),
            Gap(10.0),
            Text(
              l10n.notifications_empty_subtitle,
              textAlign: TextAlign.center,
              style: textTheme.regular14.copyWith(
                color: AppColors.greyLight.value,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
