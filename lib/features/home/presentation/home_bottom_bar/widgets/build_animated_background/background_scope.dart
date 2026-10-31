import 'package:flutter/widgets.dart';

/// Marks that an ancestor already paints the full-screen animated background.
///
/// The nearest [BuildAnimatedBackground] below an active scope skips painting
/// (so a page constrained by a responsive shell does not draw a second,
/// column-sized gradient) and deactivates the scope for its own descendants.
class BackgroundScope extends InheritedWidget {
  final bool active;

  const BackgroundScope({
    super.key,
    required this.active,
    required super.child,
  });

  static bool isActive(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<BackgroundScope>()?.active ??
      false;

  @override
  bool updateShouldNotify(BackgroundScope oldWidget) =>
      oldWidget.active != active;
}
