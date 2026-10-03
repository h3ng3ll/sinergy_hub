import 'package:flutter/material.dart';

import '../../resources/colors/app_colors.dart';

const Duration _kShimmerPeriod = Duration(milliseconds: 1400);

/// How far past each edge (in [Alignment] units) the highlight centre
/// travels: band half-width (0.2) + diagonal tilt (0.3) + margin.
const double _kBandTravel = 1.8;

class AppShimmer extends StatefulWidget {
  final Widget child;

  const AppShimmer({
    super.key,
    required this.child,
  });

  @override
  State<AppShimmer> createState() => _AppShimmerState();
}

class _AppShimmerState extends State<AppShimmer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: _kShimmerPeriod,
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: widget.child,
      builder: (context, child) {
        /// The band travels from fully off the left edge to fully off the
        /// right edge, so the loop restart is never visible as a cut.
        final shift =
            -_kBandTravel + _controller.value * (_kBandTravel * 2);

        return ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (bounds) => LinearGradient(
            begin: Alignment(shift - 1.0, -0.3),
            end: Alignment(shift + 1.0, 0.3),
            colors: [
              AppColors.platinum.value,
              AppColors.ghostWhite.value,
              AppColors.platinum.value,
            ],
            stops: const [0.4, 0.5, 0.6],
          ).createShader(bounds),
          child: child,
        );
      },
    );
  }
}
