import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../resources/colors/app_colors.dart';

const Duration _kHoverDuration = Duration(milliseconds: 180);

/// Rounded card (white, or glass when [translucent]) that lifts slightly
/// while hovered (web/desktop).
class HoverCard extends StatefulWidget {
  final Widget child;
  final EdgeInsets padding;

  /// Glass variant for content with light text on the gradient.
  final bool translucent;

  const HoverCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(20.0),
    this.translucent = false,
  });

  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool _hovered = false;

  void _onEnter(PointerEnterEvent _) => setState(() => _hovered = true);

  void _onExit(PointerExitEvent _) => setState(() => _hovered = false);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: _onEnter,
      onExit: _onExit,
      child: AnimatedContainer(
        duration: _kHoverDuration,
        curve: Curves.easeOut,
        transform: Matrix4.translationValues(
          0.0,
          _hovered ? -3.0 : 0.0,
          0.0,
        ),
        padding: widget.padding,
        decoration: BoxDecoration(
          color: widget.translucent
              ? AppColors.white.value.withValues(
                  alpha: _hovered ? 0.2 : 0.15,
                )
              : AppColors.white.value,
          border: widget.translucent
              ? Border.all(
                  width: 0.5,
                  color: AppColors.white.value.withValues(
                    alpha: 0.25,
                  ),
                )
              : null,
          borderRadius: BorderRadius.circular(
            24.0,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.jacarta.value.withValues(
                alpha: _hovered ? 0.18 : 0.10,
              ),
              offset: const Offset(0.0, 8.0),
              blurRadius: _hovered ? 32.0 : 24.0,
            ),
          ],
        ),
        child: widget.child,
      ),
    );
  }
}
