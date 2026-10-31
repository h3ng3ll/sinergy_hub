import 'package:flutter/material.dart';

import '../../../features/home/presentation/home_bottom_bar/widgets/build_animated_background/background_scope.dart';
import '../../../features/home/presentation/home_bottom_bar/widgets/build_animated_background/build_animated_background.dart';
import '../../utils/responsive_helper.dart';
import '../models/e_page_width.dart';

/// Constrains every page of a shell route to [width] on tablet/desktop.
///
/// The animated background stays full-screen; the shell's navigator (its
/// pages and their transitions) is centered inside the capped column. Pages
/// keep their own `BuildAnimatedBackground`, which [BackgroundScope] turns
/// into a pass-through so no second gradient is drawn inside the column.
///
/// Set [paintBackground] to false when an ancestor (e.g. the home bottom-bar
/// scaffold) already paints the background behind this shell.
class ResponsiveShell extends StatelessWidget {
  final EPageWidth width;
  final bool paintBackground;
  final Widget child;

  const ResponsiveShell({
    super.key,
    required this.width,
    required this.child,
    this.paintBackground = true,
  });

  @override
  Widget build(BuildContext context) {
    if (ResponsiveHelper.isMobile(context)) {
      return child;
    }

    final content = Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: width.maxWidth,
        ),
        child: BackgroundScope(
          active: true,
          child: child,
        ),
      ),
    );

    if (!paintBackground) {
      return content;
    }

    return BuildAnimatedBackground(
      child: content,
    );
  }
}
