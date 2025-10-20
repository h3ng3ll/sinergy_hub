import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../core/widgets/btn/action_btn.dart';
import '../../../../../../core/widgets/btn/translucent_btn.dart';

class NoFoundPeople extends StatefulWidget {
  final VoidCallback onAdjustFilters;

  const NoFoundPeople({
    super.key,
    required this.onAdjustFilters,
  });

  @override
  State<NoFoundPeople> createState() => _NoFoundPeopleState();
}

class _NoFoundPeopleState extends State<NoFoundPeople>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    _controller =
        AnimationController(
          vsync: this,
          duration: Duration(
            milliseconds: 1200,
          ),
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
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);
    return Column(
      children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget? child) {
            return Transform.translate(
              offset: Offset(
                0,
                20 * (1 - _animation.value),
              ),
              child: child,
            );
          },
          child: Column(
            children: [
              Icon(
                Icons.search,
                size: 80.0,
                color: colorScheme.secondary,
              ),
              Gap(10.0),
              Transform.scale(
                scale: 3,
                child: Text(
                  '😔',
                ),
              ),
            ],
          ),
        ),
        Gap(50.0),
        Text(
          'You\'ve seen everyone!',
          style: textTheme.bold24.copyWith(
            color: colorScheme.onPrimary,
          ),
        ),
        Gap(10.0),
        Text(
          'Check back later for new matches',
          style: textTheme.regular16.copyWith(
            color: colorScheme.secondary,
          ),
        ),
        Gap(20.0),
        TranslucentBtn(
          onPressed: widget.onAdjustFilters,
          text: 'Adjust Filters',
        ),
      ],
    );
  }
}
