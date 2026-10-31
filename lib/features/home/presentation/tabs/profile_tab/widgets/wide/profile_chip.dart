import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../core/resources/colors/app_gradients.dart';
import '../../../../../../../core/resources/text/app_text_theme.dart';

const Duration _kHoverDuration = Duration(milliseconds: 160);

/// Gradient pill that lifts slightly while hovered.
class ProfileChip extends StatefulWidget {
  final String label;

  const ProfileChip({
    super.key,
    required this.label,
  });

  @override
  State<ProfileChip> createState() => _ProfileChipState();
}

class _ProfileChipState extends State<ProfileChip> {
  bool _hovered = false;

  void _onEnter(PointerEnterEvent _) => setState(() => _hovered = true);

  void _onExit(PointerExitEvent _) => setState(() => _hovered = false);

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);

    return MouseRegion(
      onEnter: _onEnter,
      onExit: _onExit,
      child: AnimatedContainer(
        duration: _kHoverDuration,
        curve: Curves.easeOut,
        transform: Matrix4.translationValues(
          0.0,
          _hovered ? -2.0 : 0.0,
          0.0,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 14.0,
          vertical: 8.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            20.0,
          ),
          gradient: AppGradients.bluePurple,
          boxShadow: [
            BoxShadow(
              color: AppColors.darkOrchid.value.withValues(
                alpha: _hovered ? 0.35 : 0.0,
              ),
              offset: const Offset(0.0, 4.0),
              blurRadius: 12.0,
            ),
          ],
        ),
        child: Text(
          widget.label,
          style: textTheme.medium14.copyWith(
            color: AppColors.white.value,
          ),
        ),
      ),
    );
  }
}
