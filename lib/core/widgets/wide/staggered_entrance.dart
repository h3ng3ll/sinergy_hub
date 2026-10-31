import 'package:flutter/material.dart';

/// Share of the entrance timeline each successive item is delayed by.
const double _kStaggerStep = 0.12;

/// Share of the entrance timeline a single item takes to settle.
const double _kStaggerSpan = 0.55;

/// Vertical offset (fraction of the child's height) an item slides in from.
const double _kSlideOffset = 0.08;

/// Fades and slides [child] in, delayed by its [index] along [animation].
class StaggeredEntrance extends StatelessWidget {
  final Animation<double> animation;
  final int index;
  final Widget child;

  const StaggeredEntrance({
    super.key,
    required this.animation,
    required this.index,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final start = (index * _kStaggerStep).clamp(0.0, 1.0 - _kStaggerSpan);
    final progress = animation.drive(
      CurveTween(
        curve: Interval(
          start,
          start + _kStaggerSpan,
          curve: Curves.easeOutCubic,
        ),
      ),
    );

    return FadeTransition(
      opacity: progress,
      child: SlideTransition(
        position: progress.drive(
          Tween<Offset>(
            begin: const Offset(0.0, _kSlideOffset),
            end: Offset.zero,
          ),
        ),
        child: child,
      ),
    );
  }
}
