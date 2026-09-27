import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../../core/resources/translations/app_localizations.dart';
import '../../../../../../../core/widgets/btn/translucent_btn.dart';
import '../../../../../../../core/widgets/padding/horizontal_padding.dart';

/// One full bob cycle of the floating heart.
const Duration _kFloatDuration = Duration(milliseconds: 1200);

class NoFoundLikedYou extends StatefulWidget {
  final VoidCallback onReload;

  const NoFoundLikedYou({
    super.key,
    required this.onReload,
  });

  @override
  State<NoFoundLikedYou> createState() => _NoFoundLikedYouState();
}

class _NoFoundLikedYouState extends State<NoFoundLikedYou>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: _kFloatDuration,
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
    final l10n = AppLocalizations.of(context)!;

    return Center(
      child: HorizontalPadding(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
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
                    Icons.favorite_border_rounded,
                    size: 80.0,
                    color: colorScheme.secondary,
                  ),
                  Gap(10.0),
                  Transform.scale(
                    scale: 3,
                    child: Text(
                      '🥺',
                    ),
                  ),
                ],
              ),
            ),
            Gap(50.0),
            Text(
              l10n.liked_you_empty_title,
              textAlign: TextAlign.center,
              style: textTheme.bold24.copyWith(
                color: colorScheme.onPrimary,
              ),
            ),
            Gap(10.0),
            Text(
              l10n.liked_you_empty_subtitle,
              textAlign: TextAlign.center,
              style: textTheme.regular16.copyWith(
                color: colorScheme.secondary,
              ),
            ),
            Gap(20.0),
            TranslucentBtn(
              onPressed: widget.onReload,
              text: l10n.liked_you_reload,
            ),
          ],
        ),
      ),
    );
  }
}
