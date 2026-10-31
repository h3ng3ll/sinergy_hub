import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../../resources/colors/app_colors.dart';
import '../../resources/colors/app_gradients.dart';
import '../../resources/text/app_text_theme.dart';
import '../../widgets/build_image.dart';

/// Avatars at or above this size get the thick ring and large glow.
const double _kLargeAvatarSize = 80.0;

/// Initials font size as a fraction of the avatar size.
const double _kInitialsScale = 0.32;

/// Avatar inside a glowing gradient ring. Shows the user's [initials] on the
/// gradient when there is no photo. Optionally carries an edit badge
/// ([showEditBadge]) or an online/offline dot ([statusOnline]).
class AvatarRing extends StatelessWidget {
  final String? url;

  /// A freshly picked, not-yet-uploaded image; wins over [url].
  final Uint8List? bytes;
  final String initials;
  final double size;
  final VoidCallback? onTap;
  final bool showEditBadge;

  /// `true` green dot, `false` red dot, `null` no dot.
  final bool? statusOnline;

  const AvatarRing({
    super.key,
    required this.url,
    required this.initials,
    this.bytes,
    this.onTap,
    this.size = 120.0,
    this.showEditBadge = true,
    this.statusOnline,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    final hasPhoto = bytes != null || (url != null && url!.isNotEmpty);
    final isLarge = size >= _kLargeAvatarSize;
    final white = AppColors.white.value;
    final dotSize = isLarge ? 22.0 : 14.0;

    final ring = Container(
      padding: EdgeInsets.all(isLarge ? 4.0 : 2.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: AppGradients.bluePurple,
        boxShadow: [
          BoxShadow(
            color: AppColors.darkOrchid.value.withValues(
              alpha: isLarge ? 0.35 : 0.2,
            ),
            blurRadius: isLarge ? 28.0 : 10.0,
            offset: Offset(0.0, isLarge ? 10.0 : 3.0),
          ),
        ],
      ),
      child: Container(
        padding: EdgeInsets.all(isLarge ? 3.0 : 2.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: white,
        ),
        child: hasPhoto
            ? BuildImage(
                url: url,
                bytes: bytes,
                shape: BoxShape.circle,
                width: size,
                height: size,
              )
            : Container(
                width: size,
                height: size,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: AppGradients.bluePurple,
                ),
                child: Text(
                  initials,
                  style: textTheme.bold36.copyWith(
                    color: white,
                    fontSize: size * _kInitialsScale,
                  ),
                ),
              ),
      ),
    );

    final stack = Stack(
      clipBehavior: Clip.none,
      children: [
        ring,
        if (showEditBadge)
          Positioned(
            right: 4.0,
            bottom: 4.0,
            child: Container(
              width: 34.0,
              height: 34.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: white,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.jacarta.value.withValues(
                      alpha: 0.2,
                    ),
                    blurRadius: 8.0,
                    offset: const Offset(0.0, 2.0),
                  ),
                ],
              ),
              child: Icon(
                Icons.edit,
                size: 16.0,
                color: AppColors.majorelleBlue.value,
              ),
            ),
          ),
        if (statusOnline != null)
          Positioned(
            right: isLarge ? 8.0 : 1.0,
            bottom: isLarge ? 8.0 : 1.0,
            child: Container(
              width: dotSize,
              height: dotSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: statusOnline!
                    ? AppColors.greenCrayola.value
                    : AppColors.heartRed.value,
                border: Border.all(
                  color: white,
                  width: isLarge ? 3.0 : 2.0,
                ),
              ),
            ),
          ),
      ],
    );

    if (onTap == null) return stack;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: stack,
      ),
    );
  }
}
