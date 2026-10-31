import 'package:flutter/material.dart';

import '../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../core/resources/colors/app_gradients.dart';
import '../../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../../core/widgets/build_image.dart';

/// Avatar inside a glowing gradient ring with an edit badge. Shows the
/// user's [initials] on the gradient when there is no photo.
class ProfileAvatarRing extends StatelessWidget {
  final String? url;
  final String initials;
  final double size;
  final VoidCallback onTap;

  const ProfileAvatarRing({
    super.key,
    required this.url,
    required this.initials,
    required this.onTap,
    this.size = 120.0,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    final hasPhoto = url != null && url!.isNotEmpty;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: AppGradients.bluePurple,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.darkOrchid.value.withValues(
                      alpha: 0.35,
                    ),
                    blurRadius: 28.0,
                    offset: const Offset(0.0, 10.0),
                  ),
                ],
              ),
              child: Container(
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.white.value,
                ),
                child: hasPhoto
                    ? BuildImage(
                        url: url,
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
                            color: AppColors.white.value,
                          ),
                        ),
                      ),
              ),
            ),
            Positioned(
              right: 4.0,
              bottom: 4.0,
              child: Container(
                width: 34.0,
                height: 34.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.white.value,
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
          ],
        ),
      ),
    );
  }
}
