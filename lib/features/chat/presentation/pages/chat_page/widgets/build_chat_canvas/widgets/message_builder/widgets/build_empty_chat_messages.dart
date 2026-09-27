import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../../../../../core/resources/translations/app_localizations.dart';
import '../../../../../../../../../home/presentation/home_bottom_bar/widgets/build_animated_background/build_animated_background.dart';

/// One full back-and-forth wave of the hand.
const Duration _kWaveDuration = Duration(milliseconds: 1400);

/// Waves played per cycle before the hand rests.
const int _kWaveCount = 2;

/// Rest between wave bursts.
const Duration _kWavePause = Duration(seconds: 10);

/// Peak wave angle, in radians (~20°).
const double _kWaveAngle = math.pi / 9;

class BuildEmptyChatMessages extends StatefulWidget {
  const BuildEmptyChatMessages({super.key});

  @override
  State<BuildEmptyChatMessages> createState() => _BuildEmptyChatMessagesState();
}

class _BuildEmptyChatMessagesState extends State<BuildEmptyChatMessages>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  /// Fraction of each cycle spent waving; the remainder is the rest.
  final double _waveFraction =
      (_kWaveDuration * _kWaveCount).inMilliseconds /
      (_kWaveDuration * _kWaveCount + _kWavePause).inMilliseconds;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: _kWaveDuration * _kWaveCount + _kWavePause,
    )..repeat();
    super.initState();
  }

  /// [_kWaveCount] sine oscillations during the waving slice, still after.
  double _waveAngle(double t) {
    if (t >= _waveFraction) return 0.0;
    final progress = t / _waveFraction;
    return _kWaveAngle * math.sin(progress * 2 * math.pi * _kWaveCount);
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
            ClipRRect(
              borderRadius: BorderRadius.circular(
                200.0,
              ),
              child: SizedBox(
                width: 110.0,
                height: 110.0,
                child: BuildAnimatedBackground(
                  child: Center(
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) => Transform.rotate(
                        angle: _waveAngle(_controller.value),
                        alignment: Alignment.bottomRight,
                        child: child,
                      ),
                      child: Text(
                        '👋',
                        style: textTheme.regular20.copyWith(
                          fontSize: 48.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Gap(28.0),
            Text(
              l10n.chat_empty_title,
              style: textTheme.bold22.copyWith(
                color: AppColors.jacarta.value,
              ),
              textAlign: TextAlign.center,
            ),
            const Gap(10.0),
            Text(
              l10n.chat_empty_subtitle,
              style: textTheme.regular14.copyWith(
                color: AppColors.jacarta.value.withValues(alpha: 0.6),
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
